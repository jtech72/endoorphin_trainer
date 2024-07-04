import 'package:endoorphin_trainer/bindings/banking_details_binding.dart';
import 'package:endoorphin_trainer/bindings/bio_edit_binding.dart';
import 'package:endoorphin_trainer/bindings/session_complete_binding.dart';
import 'package:endoorphin_trainer/bindings/sign_in_option_binding.dart';
import 'package:endoorphin_trainer/bindings/upload_images_binding.dart';
import 'package:endoorphin_trainer/pages/banking_details_ui.dart';
import 'package:endoorphin_trainer/pages/bio_edit_ui.dart';
import 'package:endoorphin_trainer/pages/session_complete_ui.dart';
import 'package:endoorphin_trainer/pages/sign_in_option_ui.dart';
import 'package:endoorphin_trainer/pages/upload_images_ui.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

import '../bindings/bottom_navigation_bar_binding.dart';
import '../pages/bottom_navigation_bar_ui.dart';

class AppPages {
  static  const initialRoute = AppRoutes.sessionRunning;


  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.splash,          transitionDuration: const Duration(milliseconds: 800),
        page: () => const SplashUI(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.earning,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const EarningUi(),
        binding: EarningBinding()),
    GetPage(
        name: AppRoutes.home,          transitionDuration: const Duration(milliseconds: 800),
        page: () => const HomeUi(),
        binding: HomeBindings()),
    GetPage(
        name: AppRoutes.countrycode,        transitionDuration: const Duration(milliseconds: 800),
        page: () =>  CountryCodeUI(),
        binding: CountryCodeBinding()),
    GetPage(
        name: AppRoutes.otp,                   transitionDuration: const Duration(milliseconds: 800),
        page: () => const OtpUI(),
        binding: OtpBinding()),
    GetPage(
        name: AppRoutes.forgotPassword,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=> const ForgotPasswordUI(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.createNewPassword,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>   const CreateNewPasswordUI(),
        binding: CreateNewPasswordBinding()),
    GetPage(
        name: AppRoutes.verifyPhoneNumber,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const VerifyPhoneNumberUI(),
        binding: VerifyPhoneNumberBinding()),
    GetPage(
        name: AppRoutes.registration,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>    RegistrationUi(),
        binding: RegistrationBinding()),
    GetPage(
        name: AppRoutes.selectcategory,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const SelectCategoryUI(),
        binding: SelectCategoryBinding()),
    GetPage(
        name: AppRoutes.bio,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const BioUi(),
        binding: BioBinding()),
    GetPage(
        name: AppRoutes.login,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>   const LoginUi(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.notification,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const NotificationUi(),
        binding: NotificationBinding()),
    GetPage(
        name: AppRoutes.profile,         transitionDuration: const Duration(milliseconds:800),
        page: () => const ProfileUI(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutes.account,          transitionDuration: const Duration(milliseconds: 800),
        page: () => const AccountUI(),
        binding: AccountBinding()),
    GetPage(
        name: AppRoutes.sessionRunning,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const SessionRunningUi(),
        binding: SessionRunningBinding()),
    GetPage(
        name: AppRoutes.sessionDetails,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const SessionDetailsUi(),
        binding: SessionDetailsBindings()),
    GetPage(
        name: AppRoutes.review,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const ReviewUi(),
        binding: ReviewBinding()),
    GetPage(
        name: AppRoutes.moreaboutyou,        transitionDuration: const Duration(milliseconds: 800),
        page: () =>  const MoreAboutYouUi(),
        binding: MoreAboutYouBinding()),
    GetPage(
        name: AppRoutes.letverified,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const LetGetYouVerifiedUi(),
        binding: LetGetYouVerifiedBinding()),
GetPage(
        name: AppRoutes.trainerPassport,        transitionDuration: const Duration(milliseconds: 800),
        page: () =>   const TrainerPassportUI(),
        binding: TrainerPassportBinding()),
    GetPage(
        name: AppRoutes.bookingrequest,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const BookingRequsetUi(),
        binding: BookingRequestBinding()),
    GetPage(
        name: AppRoutes.withdraw,        transitionDuration: const Duration(milliseconds: 800),
        page: () =>  const WithdrawUI(),
        binding: WithdrawBinding()),
    GetPage(
        name: AppRoutes.document,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const DocumentUI(),
        binding: DocumentBinding()),
    GetPage(
        name: AppRoutes.support,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const SupportUI(),
        binding: SupportBinding()),
  GetPage(
        name: AppRoutes.error,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>   const ErrorUi(),
        binding: ErrorBinding()),
    GetPage(
        name: AppRoutes.noInternet,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const NoInternetUI(),
        binding: NoInternetBinding()),
    GetPage(
        name: AppRoutes.bookingdetails,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const BookingDetailsUi(),
        binding: BookingDetailsBinding()),
    GetPage(
        name: AppRoutes.sessionComplete,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>  const SessionCompleteUI(),
        binding: SessionCompleteBinding()),
  GetPage(
        name: AppRoutes.booking,        transitionDuration: const Duration(milliseconds: 800),
        page: ()=>     const BookingUi(initialIndex: 0,),
        binding: BookingBinding()),
    GetPage(
        name: AppRoutes.bottomNavigation,        transitionDuration: const Duration(milliseconds: 800),
        page: () => BottomNavigationBarUI(),
        binding: BottomNavigationBarBinding()),
    GetPage(
        name: AppRoutes.bankingDetails,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const BankingDetailsUI(),
        binding: BankingDetailsBinding()),
    GetPage(
        name: AppRoutes.signinoption,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const SignInOptionUi(),
        binding: SignInOptionBinding()),
    GetPage(
        name: AppRoutes.uploadimage,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const UploadImagesUi(),
        binding: UploadImagesBinding()),
    GetPage(
        name: AppRoutes.bioEdit,        transitionDuration: const Duration(milliseconds: 800),
        page: () => const BioEditUi(),
        binding: BioEditBinding()),
  ];
}
