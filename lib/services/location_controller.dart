import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  Location location = Location();
  Set<Marker> markers = {}; // Markers for Google map

  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);

  Future<void> getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // If service is not enabled, handle accordingly
        log("Location service is disabled.");
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // If permission is denied, handle accordingly
        log("Location permission denied.");
        return;
      }
    }
    try {
      // Get the current location
      LocationData currentLocationData = await location.getLocation();
      currentLocation.value = LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
    } catch (e) {
      log("Error getting current location: $e");
      // Handle errors here
    }
  }
}
