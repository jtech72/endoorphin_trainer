class Endpoints{

  /// DEV BASE URL
  static const String baseUrl="http://103.185.212.115:5002/api/";
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



}