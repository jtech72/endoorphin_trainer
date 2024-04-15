
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BookingRequestController extends GetxController{
  late GoogleMapController mapController;
  // Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  Location location = Location();
  RxInt selectedIndex = 0.obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  void onInit() {
    // getCurrentLocation();
  }
  @override
  void onClose() {
    selectedIndex.value = 0;
    // TODO: implement onClose
    super.onClose();
  }

  // void getCurrentLocation() async {
  //   try {
  //     LocationData currentLocationData = await location.getLocation();
  //     currentLocation.value =
  //         LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
  //   } catch (e) {
  //     log("Error getting current location: $e");
  //     // Handle errors here
  //   }
  // }

}