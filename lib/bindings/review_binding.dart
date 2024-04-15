import '../controllers/review_controller.dart';
import '../utils/exports.dart';


class ReviewBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ReviewController());
  }

}