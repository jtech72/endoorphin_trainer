import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/trainer_onboarding_controller.dart';


class TrainerOnboardingBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(TrainerOnboardingController());
  }

}