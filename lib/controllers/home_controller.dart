import 'dart:convert';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  RxInt currentIndex = 0.obs;
  Timer? pageChangeTimer;

  List<String> quickGlanceList = [
    "Earnings",
    "Sessions",
    "Points",
    "Sessions",
  ];
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
    pageChangeTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex.value < 2) { // assuming there are 3 pages (0, 1, 2)
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      pageController.jumpToPage(currentIndex.value);
    });
  }
  @override
  void onInit() {
    isTrainerOnline.value = storage.read('isTrainerOnline') ?? false;
    startPageChangeTimer();
    if (isTrainerOnline.value) {
      startLocationUpdates();
    }
    super.onInit();
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
        "addressType": addressComponents['addressType'] ?? "Unknown",
        "name": addressComponents['name'] ?? "Unknown",
        "houseNo": addressComponents['houseNo'] ?? "Unknown",
        "city": addressComponents['city'] ?? "Unknown",
        "streetArea": addressComponents['streetArea'] ?? "Unknown",
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
        Get.defaultDialog(
          title: "Enable Location",
          middleText: "Please allow location access to go online.",
          textCancel: "Cancel",
          textConfirm: "Allow",
          onConfirm: () async {
            bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
            if (!isLocationServiceEnabled) {
              Geolocator.openLocationSettings();
              return;
            }
            LocationPermission newPermission = await Geolocator.requestPermission();
            if (newPermission == LocationPermission.whileInUse ||
                newPermission == LocationPermission.always) {
              postAddress();
            } else {
              Get.snackbar('Permission Denied', 'Location permission is required to go online.');
            }
            Get.back();
          },
        );
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
          String? addressType, name, houseNo, city, streetArea;

          for (var component in components) {
            if (component['types'].contains('administrative_area_level_2')) {
              addressType = component['long_name'];
            } else if (component['types'].contains('sublocality_level_1')) {
              name = component['long_name'];
            } else if (component['types'].contains('premise')) {
              houseNo = component['long_name'];
            } else if (component['types'].contains('locality')) {
              city = component['long_name'];
            } else if (component['types'].contains('route')) {
              streetArea = component['long_name'];
            }
          }

          return {
            'addressType': addressType,
            'name': name,
            'houseNo': houseNo,
            'city': city,
            'streetArea': streetArea,
          };
        } else {
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

  Future<void> postAddress() async {
    showLoader();
    try {
      var location = Location();
      var currentLocation = await location.getLocation();
      var addressComponents = await getAddressComponentsFromLatLng(currentLocation.latitude!, currentLocation.longitude!);
      Map<String, dynamic> request = {
        "trianerId": storage.read("userId").toString(),
        "addressType": addressComponents['addressType'] ?? "Unknown",
        "name": addressComponents['name'] ?? "Unknown",
        "houseNo": addressComponents['houseNo'] ?? "Unknown",
        "city": addressComponents['city'] ?? "Unknown",
        "streetArea": addressComponents['streetArea'] ?? "Unknown",
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
