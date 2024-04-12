import '../controllers/profile_controller.dart';
import '../utils/exports.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(ProfileController());
  }

}