class Endpoints{

  /// DEV BASE URL
  // static const String baseUrl="http://103.142.118.76:5002/api/";
  static const String baseUrl="http://103.185.212.117:5002/api/";
  /// LOGIN
  static const String epLogin="trainer/signIn";
  ///SIGN UP
  static const String epSignUp="trainer/signUp";
  /// Send OTP
  static const String epSentOTP="sendOTP";
  /// CATEGORY
  static const String epGetCategory="getCategory?status=true&limit=10&page=0";
  /// STATUS OF DOC
  static const String epGetDocStatus="trainer/getRegisterTrainerCredentials?userId=";
  /// UPLOAD CERTIFICATE
  static const String epUploadCertificate="trainer/uploadDocumnetByTrainer";
  /// UPLOAD PASSPORT AND EMIRATES
  static const String epUploadPassportAndEmirates="trainer/uploadIdByTrainer";
  /// UPLOAD TRAINER PROFILE DETAILS
  static const String epUploadProfileDetails="trainer/updateTrainerProfile";
  /// GET TRAINER PROFILE DETAILS
  static const String epGetProfileDetails="trainer/getCurrentTrainerDeatils?trainerId=";
  /// Post Bank Details
  static const String epPostBankDetails="saveBankDetails";
  /// get bank detail
  static const String epGetBankDetails="getBankDetailsForTrainers?trainerId=";
  /// Update Bank Detail
  static const String epUpdateBankDetails="updateBankDetails";
  /// FORGET PASSWORD
  static const String epForgetPassword="users/forgetPassword";
  /// RESET PASSWORD
  static const String epResetPassword="users/resetPassword";
/// POST ADDRESS
  static const String epPostAddress="updateUserAddress";
  /// BOOKING ACCEPT
  static const String epBookingAccept="acceptBooking";
  /// START SESSION
  static const String epStartSession="booking/trainerOnTheWay";
  /// GET SESSION DETAILS AND VERIFY PIN
  static const String epGetSessionDetails="booking/verfiySeesionPinForTrainer";
  /// BOOKING HISTORY
  static const String epGetBookingHistory="booking/getAllBookingForTrainer";
  /// BOOKING HISTORY
  static const String epGetBookingSessionDetails="booking/sessionCompletedDetails";
  /// POST REVIEW
  static const String epPostReviewUser="review/saveReview";
  /// get Unpaid request
  static const String epUnpaid="trainer/getAllUnpaidBookingForTrainers?trainerId=";
  /// Post withdraw request
  static const String epWithdraw="trainer/trainerSendWithdrawRequest";
  /// get paid request
  static const String epGetPaid="trainer/getAllPaidBookingForTrainers?trainerId=";
  /// get requested request
  static const String epGetRequested="trainer/getAllRequestedBookingForTrainers?trainerId=";
  /// TRAINER DATA
  static const String epTrainerData="trainer/trainerDetailsCount?trainerId=";
  /// TRAINER MONTHLY DATA
  static const String epGetMonthlyData="trainer/revenueChartForMonthlyWiseDetailsForTrainer?trainerId=";
  /// TRAINER MONTHLY DATA
  static const String epGetWeeklyData="trainer/revenueWeekleyChartDetailsForTrainer?trainerId=";
  /// SUPPORT
  static const String epSupport="support/raiseTicket";
  /// GET WALLET AMOUNT
  static const String epGetWalletAmount="users/getWalletAmount?userId=";
  /// GET WALLET AMOUNT
  static const String epGetTodayNotification="getNotification?userId=";
  /// GET WALLET AMOUNT
  static const String epGetYesterdayNotification="getYesterDayNotification?userId=";
  /// GET WALLET AMOUNT
  static const String epGetWeeklyNotification="getWeekelyNotification?userId=";
 /// GET REVIEW FOR TRAINER
  static const String epGetReviewAndRating= "review/getAllReviewForTrainer?trainerId=";
  /// TRAINER ONGOING DETAILS
  static const String epGetTrainerOngoing= "getOnGoingBookingForTrainer";

}