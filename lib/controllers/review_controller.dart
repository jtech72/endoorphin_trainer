import 'dart:developer';
import '../utils/exports.dart';
class ReviewController extends GetxController{
 RxBool writeReviewVisible = false.obs;
 RxDouble ratingCount = (0.0).obs;
 String userId = "";
 String bookingId = "";
 TextEditingController descriptionController = TextEditingController();
 Future<void> onSubmitButton() async {
  if (ratingCount.value == 0.0) {
   showSnackBar("Please select a rating.");
   return;
  }

  if (descriptionController.text.trim().isEmpty) {
   showSnackBar("Please fill in the review.");
   return;
  }

  showLoader();
  Map<String, dynamic> request = {
   "reviewCount": ratingCount.value,
   "userId": userId.toString(),
   "bookingId": bookingId.toString(),
   "description": descriptionController.text.trim(),
  };
  log("request : $request");

  try {
   final result = await CallAPI.sessionReviewUser(request: request);
   dismissLoader();
   if (result.status == 200) {
    Get.offAllNamed(AppRoutes.bottomNavigation);
    showSnackBar(result.message.toString());
   } else {
    showSnackBar(result.message.toString());
   }
  } catch (e, st) {
   dismissLoader();
   log(e.toString());
   log(st.toString());
  }
 }
}