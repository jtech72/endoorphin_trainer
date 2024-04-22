import 'package:endoorphin_trainer/bindings/session_complete_binding.dart';
import 'package:endoorphin_trainer/pages/session_complete_ui.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

import '../bindings/bottom_navigation_bar_binding.dart';
import '../pages/bottom_navigation_bar_ui.dart';

class AppPages {
  static  const initialRoute = AppRoutes.bio;


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
        page: ()=>   const RegistrationUi(),
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
        name: AppRoutes.sessionDetails,
        page: () => const SessionDetailsUi(),
        binding: SessionDetailsBindings()),
    GetPage(
        name: AppRoutes.review,
        page: () => const ReviewUi(),
        binding: ReviewBinding()),
    GetPage(
        name: AppRoutes.moreaboutyou,
        page: () =>  MoreAboutYouUi(),
        binding: MoreAboutYouBinding()),
    GetPage(
        name: AppRoutes.letverified,
        page: () => const LetGetYouVerifiedUi(),
        binding: LetGetYouVerifiedBinding()),
GetPage(
        name: AppRoutes.trainerPassport,
        page: () =>   TrainerPassportUI(),
        binding: TrainerPassportBinding()),
    GetPage(
        name: AppRoutes.bookingrequest,
        page: () => const BookingRequsetUi(),
        binding: BookingRequestBinding()),
    GetPage(
        name: AppRoutes.withdraw,
        page: () =>  const WithdrawUI(),
        binding: WithdrawBinding()),
    GetPage(
        name: AppRoutes.document,
        page: () => const DocumentUI(),
        binding: DocumentBinding()),
    GetPage(
        name: AppRoutes.support,
        page: () => const SupportUI(),
        binding: SupportBinding()),
  GetPage(
        name: AppRoutes.error,
        page: ()=>   const ErrorUi(),
        binding: ErrorBinding()),
    GetPage(
        name: AppRoutes.noInternet,
        page: ()=>  const NoInternetUI(),
        binding: NoInternetBinding()),
    GetPage(
        name: AppRoutes.bookingdetails,
        page: ()=>  const BookingDetailsUi(),
        binding: BookingDetailsBinding()),
    GetPage(
        name: AppRoutes.sessionComplete,
        page: ()=>  const SessionCompleteUI(),
        binding: SessionCompleteBinding()),
  GetPage(
        name: AppRoutes.booking,
        page: ()=>    const BookingUi(),
        binding: BookingBinding()),
    GetPage(
        name: AppRoutes.bottomNavigation,
        page: () => BottomNavigationBarUI(),
        binding: BottomNavigationBarBinding()),
  ];
}
