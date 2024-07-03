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
  static  const initialRoute = AppRoutes.splash;


  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.splash,
        transitionDuration: Duration(milliseconds: 800),
        page: () => const SplashUI(),
        binding: SplashBinding()
    ),GetPage(
        name: AppRoutes.earning,        transitionDuration: Duration(milliseconds: 800),

        page: () => const EarningUi(),
        binding: EarningBinding()
    ),  GetPage(
        name: AppRoutes.home,        transitionDuration: Duration(milliseconds: 800),

        page: () => const HomeUi(),
        binding: HomeBindings()
    ),
    GetPage(
        name: AppRoutes.countrycode,        transitionDuration: Duration(milliseconds: 800),

        page: () =>  CountryCodeUI(),
        binding: CountryCodeBinding()),
    GetPage(
        name: AppRoutes.otp,        transitionDuration: Duration(milliseconds: 800),

        page: () => const OtpUI(),
        binding: OtpBinding()),
    GetPage(
        name: AppRoutes.forgotPassword,        transitionDuration: Duration(milliseconds: 800),

        page: ()=> const ForgotPasswordUI(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.createNewPassword,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>   CreateNewPasswordUI(),
        binding: CreateNewPasswordBinding()),
    GetPage(
        name: AppRoutes.verifyPhoneNumber,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const VerifyPhoneNumberUI(),
        binding: VerifyPhoneNumberBinding()),
    GetPage(
        name: AppRoutes.registration,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>    RegistrationUi(),
        binding: RegistrationBinding()),
    GetPage(
        name: AppRoutes.selectcategory,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const SelectCategoryUI(),
        binding: SelectCategoryBinding()),
    GetPage(
        name: AppRoutes.bio,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const BioUi(),
        binding: BioBinding()),
    GetPage(
        name: AppRoutes.login,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>   LoginUi(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.notification,        transitionDuration: Duration(milliseconds: 800),

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
        name: AppRoutes.sessionRunning,        transitionDuration: Duration(milliseconds: 800),

        page: () => const SessionRunningUi(),
        binding: SessionRunningBinding()),
    GetPage(
        name: AppRoutes.sessionDetails,        transitionDuration: Duration(milliseconds: 800),

        page: () => const SessionDetailsUi(),
        binding: SessionDetailsBindings()),
    GetPage(
        name: AppRoutes.review,        transitionDuration: Duration(milliseconds: 800),

        page: () => const ReviewUi(),
        binding: ReviewBinding()),
    GetPage(
        name: AppRoutes.moreaboutyou,        transitionDuration: Duration(milliseconds: 800),

        page: () =>  MoreAboutYouUi(),
        binding: MoreAboutYouBinding()),
    GetPage(
        name: AppRoutes.letverified,        transitionDuration: Duration(milliseconds: 800),

        page: () => const LetGetYouVerifiedUi(),
        binding: LetGetYouVerifiedBinding()),
GetPage(
        name: AppRoutes.trainerPassport,        transitionDuration: Duration(milliseconds: 800),

    page: () =>   TrainerPassportUI(),
        binding: TrainerPassportBinding()),
    GetPage(
        name: AppRoutes.bookingrequest,        transitionDuration: Duration(milliseconds: 800),

        page: () => const BookingRequsetUi(),
        binding: BookingRequestBinding()),
    GetPage(
        name: AppRoutes.withdraw,        transitionDuration: Duration(milliseconds: 800),

        page: () =>  const WithdrawUI(),
        binding: WithdrawBinding()),
    GetPage(
        name: AppRoutes.document,        transitionDuration: Duration(milliseconds: 800),

        page: () => const DocumentUI(),
        binding: DocumentBinding()),
    GetPage(
        name: AppRoutes.support,        transitionDuration: Duration(milliseconds: 800),

        page: () => const SupportUI(),
        binding: SupportBinding()),
  GetPage(
        name: AppRoutes.error,        transitionDuration: Duration(milliseconds: 800),

      page: ()=>   const ErrorUi(),
        binding: ErrorBinding()),
    GetPage(
        name: AppRoutes.noInternet,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const NoInternetUI(),
        binding: NoInternetBinding()),
    GetPage(
        name: AppRoutes.bookingdetails,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const BookingDetailsUi(),
        binding: BookingDetailsBinding()),
    GetPage(
        name: AppRoutes.sessionComplete,        transitionDuration: Duration(milliseconds: 800),

        page: ()=>  const SessionCompleteUI(),
        binding: SessionCompleteBinding()),
  GetPage(
        name: AppRoutes.booking,        transitionDuration: Duration(milliseconds: 800),

      page: ()=>     BookingUi(initialIndex: 0,),
        binding: BookingBinding()),
    GetPage(
        name: AppRoutes.bottomNavigation,        transitionDuration: Duration(milliseconds: 800),
        page: () => BottomNavigationBarUI(),
        binding: BottomNavigationBarBinding()),
    GetPage(
        name: AppRoutes.bankingDetails,        transitionDuration: Duration(milliseconds: 800),

        page: () => BankingDetailsUI(),
        binding: BankingDetailsBinding()),
    GetPage(
        name: AppRoutes.signinoption,        transitionDuration: Duration(milliseconds: 800),

        page: () => SignInOptionUi(),
        binding: SignInOptionBinding()),
    GetPage(
        name: AppRoutes.uploadimage,        transitionDuration: Duration(milliseconds: 800),

        page: () => UploadImagesUi(),
        binding: UploadImagesBinding()),
    GetPage(
        name: AppRoutes.bioEdit,        transitionDuration: Duration(milliseconds: 800),

        page: () => BioEditUi(),
        binding: BioEditBinding()),
  ];
}
