import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../utils/exports.dart';

class LocationController{
  Location location = Location();
  Set<Marker> markers = {}; //markers for google map

  static Rx<LatLng?> currentLocation = Rx<LatLng?>(null);

  void getCurrentLocation() async {
    try {
      LocationData currentLocationData = await location.getLocation();
      currentLocation.value = LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
    } catch (e) {
      log("Error getting current location: $e");
      // Handle errors here
    }
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/briefcase.png",
    );

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(currentLocation.value.toString()),
          position: LatLng(
            currentLocation.value!.latitude!,
            currentLocation.value!.longitude!,
          ), //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Starting Point ',
            snippet: 'Start Marker',
          ),
          icon: markerbitmap, //Icon for Marker
        )
    );
  }

}