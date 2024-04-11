import 'package:endoorphin_trainer/utils/exports.dart';

import '../bindings/create_new_password_binding.dart';
import '../bindings/forgot_password_binding.dart';
import '../bindings/select_category_binding.dart';
import '../bindings/trainer_onboarding_binding.dart';
import '../bindings/verify_phone_number_binding.dart';
import '../pages/create_new_password_ui.dart';
import '../pages/forgot_password_ui.dart';
import '../pages/select_category_ui.dart';
import '../pages/trainer_onboarding_ui.dart';
import '../pages/verify_phone_number_ui.dart';
class AppPages {
  static  const initialRoute = AppRoutes.registration;
  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashUI(),
        binding: SplashBinding()
    ),
    GetPage(
        name: AppRoutes.countrycode,
        page: () => const CountryCodeUI(),
        binding: CountryCodeBinding()),
    GetPage(
        name: AppRoutes.otp,
        page: () => const OtpUI(),
        binding: OtpBinding()),
    GetPage(
        name: AppRoutes.forgotPassword,
        page: ()=> const ForgotPasswordUI(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.createNewPassword,
        page: ()=>  const CreateNewPasswordUI(),
        binding: CreateNewPasswordBinding()),
    GetPage(
        name: AppRoutes.verifyPhoneNumber,
        page: ()=>  const VerifyPhoneNumberUI(),
        binding: VerifyPhoneNumberBinding()),
    GetPage(
        name: AppRoutes.traineronboarding,
        page: ()=>  const TrainerOnboardingUi(),
        binding: TrainerOnboardingBinding()),
    GetPage(
        name: AppRoutes.registration,
        page: ()=>  const SelectCategoryUI(),
        binding: SelectCategoryBinding()),
  ];
}
