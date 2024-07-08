import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = ["Earnings", "Sessions","Points","Sessions",];
  RxInt selectedIndex = (-1).obs;

  final items = [ "Yoga","Padel Tennis","Swimming","Tennis","Boxing","Personal Training"];
  final items2 = ['last 3 days','last 5 days','last 7 days'];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }
  final selectedOption = 'Yoga''Tennis'.obs;
  RxString selectedOption1 = 'last 3 days'.obs;

  onToggleButton(){
    if (!isTrainerOnline.value) {
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
          LocationPermission permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
            isTrainerOnline.value = true;
          } else {
            Get.snackbar('Permission Denied', 'Location permission is required to go online.');
          }

          Get.back();
        },
      );
    } else {
      isTrainerOnline.value = false;

    }
  }

  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStarts,
        isForegroundMode: true,
        autoStart: true,
        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'Background Service',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        onForeground: onStarts,
        autoStart: true,
      ),
    );

    service.startService();
  }

  void onStarts(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();

    Location location = Location();
    Timer.periodic(Duration(minutes: 5), (timer) async {
      if (service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: "Location Service",
          content: "Sending location to server",
        );
      }

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
  @override
  void onInit() {
    initializeService();
    super.onInit();
  }
}
//