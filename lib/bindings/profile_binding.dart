import '../utils/exports.dart';
class ProfileBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(ProfileController());
  }
}