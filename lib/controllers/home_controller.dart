import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = [
    "Earnings",
    "Sessions",
    "Points",
    "Sessions",
  ];
  RxInt selectedIndex = (-1).obs;
  Location location = Location();

  final items = [
    "Yoga",
    "Padel Tennis",
    "Swimming",
    "Tennis",
    "Boxing",
    "Personal Training"
  ];
  final items2 = ['last 3 days', 'last 5 days', 'last 7 days'];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }

  final selectedOption = 'Yoga''Tennis'.obs;
  RxString selectedOption1 = 'last 3 days'.obs;

  onToggleButton() async {
    if (!isTrainerOnline.value) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
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
            bool isLocationServiceEnabled = await Geolocator
                .isLocationServiceEnabled();
            if (!isLocationServiceEnabled) {
              Geolocator.openLocationSettings();
              return;
            }
            LocationPermission newPermission = await Geolocator
                .requestPermission();
            if (newPermission == LocationPermission.whileInUse ||
                newPermission == LocationPermission.always) {
              postAddress();
            } else {
              Get.snackbar('Permission Denied',
                  'Location permission is required to go online.');
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
          "trianerId":storage.read("userId").toString(),
          "addressType":addressComponents['addressType'] ?? "Unknown",
          "name":addressComponents['name'] ?? "Unknown",
          "houseNo":addressComponents['houseNo'] ?? "Unknown",
          "city":addressComponents['city'] ?? "Unknown",
          "streetArea":addressComponents['streetArea'] ?? "Unknown",
          "lat":currentLocation.latitude,
          "long":currentLocation.longitude,
          "activeStatus":!isTrainerOnline.value
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
}