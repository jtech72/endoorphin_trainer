import 'dart:convert';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../services/models/response_models/get_trianer_all_data.dart';
class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  RxInt currentIndex = 0.obs;
  Timer? pageChangeTimer;
  Rx<GetTrainerAllData> trainerSessionDetails = GetTrainerAllData().obs;
  List<String> quickGlanceList = [
    "Earnings",
    "Sessions",
    "Points",
    "Sessions",
  ];
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  RxInt selectedIndex = (-1).obs;
  Location location = Location();
  PageController pageController = PageController();
  final GlobalKey menuKey = GlobalKey();
  final items2 = ['last 3 days', 'last 5 days', 'last 7 days'];
  RxString selectedOption1 = 'last 3 days'.obs;
  Timer? locationUpdateTimer;
  void openMenu() {
    final dynamic state = menuKey.currentState;
    state.showButtonMenu();
  }
  void startPageChangeTimer() {
    pageChangeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex.value < 2) { // assuming there are 3 pages (0, 1, 2)
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      // Use animateToPage instead of jumpToPage for a smooth transition
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500), // adjust the duration as needed
        curve: Curves.easeInOut, // you can change the curve to your preference
      );
    });
  }
  @override
  void onInit() {
    isTrainerOnline.value = storage.read('isTrainerOnline') ?? false;
    startPageChangeTimer();
    checkSessionIsRunning();
    if (isTrainerOnline.value) {
      startLocationUpdates();
    }
    super.onInit();
  }
  Future<GetTrainerAllData> onDateChange()async{
    await   CallAPI.getTrainerAllData( trainerId: storage.read("userId").toString()).then((value){
      trainerSessionDetails.value=value;
      log("TRAINER DOC DATA: => ${trainerSessionDetails.value.toString()}");
    });
    return trainerSessionDetails.value;
  }
  void startLocationUpdates() {
    locationUpdateTimer ??= Timer.periodic(const Duration(minutes: 5), (timer) async {
        if (isTrainerOnline.value) {
          await _updateLocation();
        }
      });
  }

  void _stopLocationUpdates() {
    locationUpdateTimer?.cancel();
    locationUpdateTimer = null;
  }

  Future<void> _updateLocation() async {
    try {
      var location = Location();
      var currentLocation = await location.getLocation();
      var addressComponents = await getAddressComponentsFromLatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );
      Map<String, dynamic> request = {
        "trianerId": storage.read("userId").toString(),
        "addressType":  addressComponents['addressType'] ?? "",
        "city": addressComponents['city'] ?? "Unknown",
        "lat": currentLocation.latitude,
        "long": currentLocation.longitude,
        "activeStatus": true,
      };

      var response = await CallAPI.postAddress(request: request);

      if (response.status == 200) {
        log('Location updated successfully');
      } else {
        log('Failed to update location');
      }
    } catch (e) {
      log('Error occurred while updating location: $e');
    }
  }

  @override
  void onClose() {
    pageChangeTimer?.cancel();
    startPageChangeTimer();
    pageController.dispose();
    super.onClose();
  }

  void onToggleButton() async {
    if (!isTrainerOnline.value) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        postAddress();
        log("Permission already granted");
      } else {
        bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!isLocationServiceEnabled) {
          Geolocator.requestPermission();
          return;
        }
        LocationPermission newPermission = await Geolocator.requestPermission();
        if (newPermission == LocationPermission.whileInUse ||
            newPermission == LocationPermission.always) {
          postAddress();
        } else {
          Get.snackbar('Permission Denied', 'Location permission is required to go online.');
        }
        // Get.defaultDialog(
        //   title: "Enable Location",
        //   middleText: "Please allow location access to go online.",
        //   textCancel: "Cancel",
        //   textConfirm: "Allow",
        //   onConfirm: () async {
        //
        //     Get.back();
        //   },
        // );
      }
    } else {
      postAddress();
    }
  }
  Future<Map<String, String?>> getAddressComponentsFromLatLng(double latitude, double longitude) async {
    const apiKey = 'AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo';
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
    log("url for placename $url");
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 'OK' && jsonData['results'].isNotEmpty) {
          final components = jsonData['results'][0]['address_components'];
          final formattedAddress = jsonData['results'][0]['formatted_address'];
          String? addressType, houseNo, city, streetArea, postalCode, country, premise, subPremise;

          for (var component in components) {
            log('Component: ${component['long_name']} - Types: ${component['types']}');
            if (component['types'].contains('premise')) {
              premise = component['long_name']; // E.g., Berkeley Square, Plot 24
            } else if (component['types'].contains('subpremise')) {
              subPremise = component['long_name']; // E.g., Unit 21, Level 2
            } else if (component['types'].contains('sublocality_level_1') || component['types'].contains('sublocality')) {
              streetArea = component['long_name'];
            } else if (component['types'].contains('locality')) {
              city = component['long_name'];
            } else if (component['types'].contains('administrative_area_level_1')) {
              addressType = component['long_name'];  // State/Province
            } else if (component['types'].contains('country')) {
              country = component['long_name'];
            } else if (component['types'].contains('postal_code')) {
              postalCode = component['long_name'];
            }
          }

          // Construct the full address string without commas
          String fullAddress = [
            subPremise,  // E.g., Unit 21, Level 2
            premise,     // E.g., Berkeley Square, Plot 24
            streetArea,  // E.g., Industrial Area Phase I
            city,        // E.g., Chandigarh
            addressType, // E.g., Chandigarh
            country,     // E.g., India
            postalCode   // E.g., 160002
          ].where((element) => element != null && element.isNotEmpty).join(' ');

          return {
            'addressType': fullAddress,
            'name': formattedAddress,  // Assign the formatted address to name
            'houseNo': houseNo,
            'city': city,
            'streetArea': streetArea,  // Ensure streetArea is set to sublocality
          };
        } else {
          log('No results found or status is not OK');
          return {};
        }
      } else {
        log('Request failed with status: ${response.statusCode}');
        return {};
      }
    } catch (e, st) {
      log('Error retrieving place name: $e');
      log('Error retrieving place name: $st');
      return {};
    }
  }
  Future<void> checkSessionIsRunning() async {
    final response = await CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"pending" );
    if (response.result == null || response.result!.isEmpty) {
      print("No bookings found.");
      return;
    }
    var sessionItem = response.result!.firstWhereOrNull((item) => item.pinStatus != null);
    if (sessionItem != null) {
      Get.toNamed(AppRoutes.sessionRunning, arguments: {
        "id": sessionItem.id.toString(),
        "pin": sessionItem.sessionPin.toString(),
      });      print("Pin status is not null in at least one booking.");
    } else {
      print("All pinStatus values are null.");
    }
  }

  Future<void> postAddress() async {
    showLoader();
    try {
      var location = Location();
      var currentLocation = await location.getLocation();
      var addressComponents = await getAddressComponentsFromLatLng(currentLocation.latitude!, currentLocation.longitude!);
      Map<String, dynamic> request = {
        "trianerId": storage.read("userId").toString(),
        "addressType":  addressComponents['addressType'] ?? "",
        // "name": addressComponents['name'] ?? "Unknown",
        // "houseNo": addressComponents['houseNo'] ?? "Unknown",
        "city": addressComponents['city'] ?? "Unknown",
        // "streetArea": addressComponents['streetArea'] ?? "Unknown",
        "lat": currentLocation.latitude,
        "long": currentLocation.longitude,
        "activeStatus": !isTrainerOnline.value
      };

      var response = await CallAPI.postAddress(request: request);

      if (response.status == 200) {
        dismissLoader();
        isTrainerOnline.value = !isTrainerOnline.value;
        storage.write('isTrainerOnline', isTrainerOnline.value);
        if (isTrainerOnline.value) {
          startLocationUpdates();
        } else {
          _stopLocationUpdates();
        }
        log(isTrainerOnline.value.toString());
        log('Location sent successfully');
      } else {
        dismissLoader();
        log('Failed to send location');
      }

    } catch (e) {
      dismissLoader();
      log('Error occurred: $e');
    }
  }
}
