import '../utils/exports.dart';
class RatingController extends GetxController{
  String calculateDifferenceInDays(String dateString) {
    DateTime inputDate = DateTime.parse(dateString);
    DateTime currentDate = DateTime.now();
    int differenceInDays = currentDate.difference(inputDate).inDays;
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