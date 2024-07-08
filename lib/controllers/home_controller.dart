import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = ["Earnings", "Sessions","Points","Sessions",];
  RxInt selectedIndex = (-1).obs;
  Location location = Location();

  final items = [ "Yoga","Padel Tennis","Swimming","Tennis","Boxing","Personal Training"];
  final items2 = ['last 3 days','last 5 days','last 7 days'];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }

  final selectedOption = 'Yoga''Tennis'.obs;
  RxString selectedOption1 = 'last 3 days'.obs;

  onToggleButton() async {
    if (!isTrainerOnline.value) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        postAddress();
        print("Permission already granted");
      } else {
        // Show dialog to request permission
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
            if (newPermission == LocationPermission.whileInUse || newPermission == LocationPermission.always) {
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
  void onStarts() async {
    DartPluginRegistrant.ensureInitialized();

    Timer.periodic(Duration(minutes: 5), (timer) async {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      Map<String, dynamic> request = {
        "userId":storage.read("userId").toString(),
        "lat":_locationData.latitude!,
        "long":_locationData.longitude!,
        "activeStatus":isTrainerOnline.value
      };
      var response = await CallAPI.postAddress(request: request);

      if (response.status == 200) {
        print('Location sent successfully');
      } else {
        print('Failed to send location');
      }
    });
  }
  Future<void> postAddress() async {
    showLoader();
    try {
      var currentLocation = await location.getLocation();

      Map<String, dynamic> request = {
        "trianerId": storage.read("userId").toString(),
        "lat": currentLocation.latitude,
        "long": currentLocation.longitude,
        "activeStatus": isTrainerOnline.value
      };

      var response = await CallAPI.postAddress(request: request);

      if (response.status == 200) {
        dismissLoader();
        isTrainerOnline.value = !isTrainerOnline.value;
        log(isTrainerOnline.value.toString());
        print('Location sent successfully');
      } else {
        dismissLoader();
        print('Failed to send location');
      }
    } catch (e) {
      dismissLoader();
      print('Error occurred: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
//