import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RatingController extends GetxController{
  String calculateDifferenceInDays(String dateString) {
    // Parse the input date string
    DateTime inputDate = DateTime.parse(dateString);

    // Get the current date and time
    DateTime currentDate = DateTime.now();

    // Calculate the difference in days
    int differenceInDays = currentDate.difference(inputDate).inDays;

    // Create a human-readable string
    if (differenceInDays == 1) {
      return "1 day ago";
    } else if (differenceInDays > 1) {
      return "$differenceInDays days ago";
    } else if (differenceInDays == 0) {
      return "Today";
    } else {
      return "${-differenceInDays} days from now";
    }
  }
  RxBool writeReviewVisible = false.obs;
  RxDouble ratingCount = (0.0).obs;
}