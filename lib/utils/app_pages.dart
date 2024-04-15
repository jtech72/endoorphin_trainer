import 'package:endoorphin_trainer/bindings/profile_binding.dart';
import 'package:endoorphin_trainer/bindings/trainer_passport_binding.dart';
import 'package:endoorphin_trainer/pages/profile_ui.dart';
import 'package:endoorphin_trainer/bindings/earning_binding.dart';
import 'package:endoorphin_trainer/bindings/home_binding.dart';
import 'package:endoorphin_trainer/pages/earning_ui.dart';
import 'package:endoorphin_trainer/pages/home_ui.dart';
import 'package:endoorphin_trainer/pages/trainer_passport_ui.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

import '../bindings/account_binding.dart';
import '../bindings/notification_binding.dart';
import '../bindings/session_running_binding.dart';
import '../pages/account_ui.dart';
import '../pages/notification_ui.dart';
import '../pages/session_running_ui.dart';




class AppPages {
  static  const initialRoute = AppRoutes.trainerPassport;
  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashUI(),
        binding: SplashBinding()
    ),GetPage(
        name: AppRoutes.earning,
        page: () => const EarningUi(),
        binding: EarningBinding()
    ),  GetPage(
        name: AppRoutes.home,
        page: () => const HomeUi(),
        binding: HomeBindings()
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
        name: AppRoutes.registration,
        page: ()=>  const RegistrationUi(),
        binding: RegistrationBinding()),
    GetPage(
        name: AppRoutes.selectcategory,
        page: ()=>  const SelectCategoryUI(),
        binding: SelectCategoryBinding()),
    GetPage(
        name: AppRoutes.bio,
        page: ()=>  const BioUi(),
        binding: BioBinding()),
    GetPage(
        name: AppRoutes.login,
        page: ()=>  const LoginUi(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.notification,
        page: () => const NotificationUi(),
        binding: NotificationBinding()
    ),
    GetPage(
        name: AppRoutes.profile,
        page: () => const ProfileUI(),
        binding: ProfileBinding()
    ),
    GetPage(
        name: AppRoutes.account,
        page: () => const AccountUI(),
        binding: AccountBinding()),
    GetPage(
        name: AppRoutes.sessionRunning,
        page: () => const SessionRunningUi(),
        binding: SessionRunningBinding()),
    GetPage(
        name: AppRoutes.trainerPassport,
        page: () => const TrainerPassportUI(),
        binding: TrainerPassportBinding()),
  ];
}
