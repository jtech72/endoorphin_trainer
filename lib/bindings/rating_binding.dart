import 'package:endoorphin_trainer/utils/exports.dart';
class RatingBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RatingController());
  }
}