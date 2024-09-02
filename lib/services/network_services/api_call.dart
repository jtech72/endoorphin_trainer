import 'dart:developer';
import 'dart:io';

import 'package:endoorphin_trainer/services/models/request_models/session_start_model.dart';
import 'package:endoorphin_trainer/services/models/response_models/get_category_model.dart';

import '../../custom_Widgets/common_widgets.dart';
import '../models/request_models/booking_accept_model.dart';
import '../models/request_models/category_document_model.dart';
import '../models/request_models/forget_password_model.dart';
import '../models/request_models/login_model.dart';
import '../models/request_models/post_address_model.dart';
import '../models/request_models/reset_password_model.dart';
import '../models/request_models/save_bankdetail_model.dart';
import '../models/request_models/send_otp_model.dart';
import '../models/request_models/session_detail_model.dart';
import '../models/request_models/sign_up_model.dart';
import '../models/request_models/update_bank_detail_model.dart';
import '../models/request_models/withdraw_request_model.dart';
import '../models/response_models/get_bank_detail.dart';
import '../models/response_models/get_booking_history_model.dart';
import '../models/response_models/get_monthly_data.dart';
import '../models/response_models/get_notification_model.dart';
import '../models/response_models/get_session_detail_model.dart';
import '../models/response_models/get_trainer_doc_status_model.dart';
import '../models/response_models/get_trainer_ongoing_model.dart';
import '../models/response_models/get_trianer_all_data.dart';
import '../models/response_models/get_unpaid_withdraw_model.dart';
import '../models/response_models/get_wallet_amount_model.dart';
import '../models/response_models/get_weekly_data_model.dart';
import '../models/response_models/profile_detail_model.dart';
import '../models/response_models/review_and_rating_model.dart';
import 'api_manager.dart';
import 'endpoints.dart';

class CallAPI {
  /// SEND OTP
  static Future<SentOtpModel> sentOTP({required var request}) async {
    SentOtpModel result = SentOtpModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epSentOTP,
        request: request,
      );

      SentOtpModel responseModel = SentOtpModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epSentOTP}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }

  /// LOGIN
  static Future<LoginModel> login({required var request}) async {
    LoginModel result = LoginModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epLogin,
        request: request,
      );

      LoginModel responseModel = LoginModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }

  /// SIGN UP
  static Future<SignUpModel> uploadUserdata({required var request}) async {
    SignUpModel result = SignUpModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        request: request,
        endpoint: Endpoints.epSignUp,
      );

      SignUpModel responseModel = SignUpModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }

  /// GET CATEGORY
  static Future<GetCategoryModel> getCategory() async {
    try {
      String endPoint = Endpoints.epGetCategory;
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: endPoint);
      GetCategoryModel responseModel = GetCategoryModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $endPoint ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetCategoryModel(status: 500); // Return an error status
    }
  }

  /// GET CATEGORY
  static Future<GetTrainerDocStatusModel> getDocStatus(String params) async {
    try {
      // Construct the endpoint URL with the given parameters string
      String endPoint = Endpoints.epGetDocStatus;
      String fullUrl = '$endPoint$params';

      // Call the API with the constructed URL
      Map<String, dynamic> json =
          await APIManager().getAllCall(endPoint: fullUrl);
      GetTrainerDocStatusModel responseModel =
          GetTrainerDocStatusModel.fromJson(json);

      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetTrainerDocStatusModel(status: 500); // Return an error status
    }
  }

  /// UPLOAD CERTIFICATE DETAILS (CATEGORY TYPE)
 static Future<DocumentModel> uploadCertificate({required Map<String, String> fields, required Map<String, File> files,}) async {
    DocumentModel result = DocumentModel();
    try {
      Map<String, dynamic> json = await APIManager().putMultipartAPICall(
        endPoint: Endpoints.epUploadCertificate,
        fields: fields,
        files: files,
      );

      DocumentModel responseModel = DocumentModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        print("CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT: $json");
        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      print("Error in API CALL: $e");
      print(st);
      return result;
    }
  }

  /// UPLOAD CERTIFICATE DETAILS (PASSPORT & EMIRATES TYPE)
  static Future<DocumentModel> uploadPassportAndEmirates({required Map<String, String> fields, required Map<String, File> files,}) async {
    DocumentModel result = DocumentModel();
    try {
      // Convert File objects to List<int>
      Map<String, List<int>> filesAsBytes = {};
      files.forEach((key, file) {
        List<int> bytes = file.readAsBytesSync();
        filesAsBytes[key] = bytes;
      });

      // Call the APIManager method with converted files
      Map<String, dynamic> json = await APIManager().putMultipartAPICall(
        endPoint: Endpoints.epUploadPassportAndEmirates,
        fields: fields,
        files: files,
      );

      DocumentModel responseModel = DocumentModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        log("CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT: $json");
        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      print("Error in API CALL: $e");
      print(st);
      return result;
    }
  }

  /// UPLOAD PROFILE DETAILS
  static Future<DocumentModel> uploadProfileDetails({required Map<String, String> fields, required Map<String, File> files,}) async {
    DocumentModel result = DocumentModel();
    try {
      // Convert File objects to List<int>
      Map<String, List<int>> filesAsBytes = {};
      files.forEach((key, file) {
        List<int> bytes = file.readAsBytesSync();
        filesAsBytes[key] = bytes;
      });

      // Call the APIManager method with converted files
      Map<String, dynamic> json = await APIManager().putMultipartAPICall(
        endPoint: Endpoints.epUploadProfileDetails,
        fields: fields,
        files: files,
      );
      DocumentModel responseModel = DocumentModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        log("CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT: $json");
        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      print("Error in API CALL: $e");
      print(st);
      return result;
    }
  }

  /// GET PROFILE DETAILS
  static Future<ProfileDetailsModel> getProfileDetails(String params) async {
    try {
      String endPoint = Endpoints.epGetProfileDetails;
      String fullUrl = '$endPoint$params';
      Map<String, dynamic> json =
      await APIManager().getAllCall(endPoint: fullUrl);
      ProfileDetailsModel responseModel =
      ProfileDetailsModel.fromJson(json);

      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return ProfileDetailsModel(status: 500); // Return an error status
    }
  }
  /// Post Bank Detail
  static Future<SavebankDetailModel> saveBankDetail({required var request}) async {
    SavebankDetailModel result = SavebankDetailModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epPostBankDetails,
        request: request,
      );

      SavebankDetailModel responseModel = SavebankDetailModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epPostBankDetails}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }

/// Get bank detail
  static Future<GetBankDetailModel> getBankDetail({required String id}) async {
    try {
      String endPoint = Endpoints.epGetBankDetails;
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: endPoint+id);
      GetBankDetailModel responseModel = GetBankDetailModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $endPoint ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetBankDetailModel(status: 500); // Return an error status
    }
  }
  static Future<UpdateBankDetailModel> updateBankDetail({required request}) async {
    UpdateBankDetailModel result = UpdateBankDetailModel();
    try {
      String endPoint = Endpoints.epUpdateBankDetails;
      Map<dynamic, dynamic> json =
      await APIManager().putAPICall(endPoint: endPoint, request: request);
      UpdateBankDetailModel responseModel = UpdateBankDetailModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        log("CALLING_ENDPOINT: $endPoint ,RESPONSE:  $json");
        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e) {
      log(e.toString());
      return result;
    }
  }

/// FORGET PASSWORD
  static Future<ForgetPasswordModel> forgetPassword({required var request}) async {
    ForgetPasswordModel result = ForgetPasswordModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epForgetPassword,
        request: request,
      );

      ForgetPasswordModel responseModel = ForgetPasswordModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// RESET PASSWORD
  static Future<ResetPasswordModel> resetPassword({required var request}) async {
    ResetPasswordModel result = ResetPasswordModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epResetPassword,
        request: request,
      );

      ResetPasswordModel responseModel = ResetPasswordModel.fromJson(json);
      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// POST ADDRESS
  static Future<PostAddressModel> postAddress({required var request}) async {
    PostAddressModel result = PostAddressModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epPostAddress,
        request: request,
      );

      PostAddressModel responseModel = PostAddressModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// BOOKING ACCEPT
  static Future<BookingAcceptDetailsModel> bookingAccept({required var request}) async {
    BookingAcceptDetailsModel result = BookingAcceptDetailsModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epBookingAccept,
        request: request,
      );

      BookingAcceptDetailsModel responseModel = BookingAcceptDetailsModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// SESSION START
  static Future<SessionStartModel> sessionStart({required var request}) async {
    SessionStartModel result = SessionStartModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epStartSession,
        request: request,
      );

      SessionStartModel responseModel = SessionStartModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// GET SESSION AND VERIFY PIN
  static Future<SessionDetailModel> getSessionDetails({
    required String id,
    required String pinSession,
  }) async {
    try {
      String endPoint = Endpoints.epGetSessionDetails;
      String fullUrl = "$endPoint?id=$id&pinSession=$pinSession";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      SessionDetailModel responseModel = SessionDetailModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return SessionDetailModel(status: 500); // Return an error status
    }
  }
  /// GET BOOKING HISTORY
  static Future<GetBookingHistoryModel> getBookingHistory({required String id, required String bookingStatus,}) async {
    try {
      String endPoint = Endpoints.epGetBookingHistory;
      String fullUrl = "$endPoint?bookingStatus=$bookingStatus&trainerId=$id";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetBookingHistoryModel responseModel = GetBookingHistoryModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetBookingHistoryModel(status: 500); // Return an error status
    }
  }
  /// GET BOOKING DETAILS
  static Future<SessionBookingDetailModel> getBookingDetails({required String id}) async {
    try {
      String endPoint = Endpoints.epGetBookingSessionDetails;
      String fullUrl = "$endPoint?id=$id";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      SessionBookingDetailModel responseModel = SessionBookingDetailModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return SessionBookingDetailModel(status: 500); // Return an error status
    }
  }
  /// get unpaid request
  static Future<GetUnpaidBookingModel> getUnpaid({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epUnpaid;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetUnpaidBookingModel responseModel = GetUnpaidBookingModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetUnpaidBookingModel(status: 500); // Return an error status
    }
  }
  /// get Requested request
  static Future<GetUnpaidBookingModel> getRequestedBookings({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetRequested;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetUnpaidBookingModel responseModel = GetUnpaidBookingModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetUnpaidBookingModel(status: 500); // Return an error status
    }
  }
  /// get Paid request
  static Future<GetUnpaidBookingModel> getPaidSession({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetPaid;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetUnpaidBookingModel responseModel = GetUnpaidBookingModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetUnpaidBookingModel(status: 500); // Return an error status
    }
  }
  /// POST REVIEW USER
  static Future<SessionStartModel> sessionReviewUser({required var request}) async {
    SessionStartModel result = SessionStartModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epPostReviewUser,
        request: request,
      );

      SessionStartModel responseModel = SessionStartModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// Post Withdraw Request
  static Future<WithdrawRequestModel> withdrawReq({required var request}) async {
    WithdrawRequestModel result = WithdrawRequestModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epWithdraw,
        request: request,
      );

      WithdrawRequestModel responseModel = WithdrawRequestModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// Post Withdraw Request
  static Future<WithdrawRequestModel> supportRequest({required var request}) async {
    WithdrawRequestModel result = WithdrawRequestModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        endpoint: Endpoints.epSupport,
        request: request,
      );

      WithdrawRequestModel responseModel = WithdrawRequestModel.fromJson(json);

      if (responseModel.status == 200) {
        result = responseModel;
        printResult(
            screenName: 'API CALL',
            msg: "CALLING ENDPOINTS ${Endpoints.epLogin}, RESULT:$json");

        return result;
      } else {
        result = responseModel;
        return result;
      }
    } on Exception catch (e, st) {
      printResult(
          screenName: 'API CALL', msg: "", error: e.toString(), stackTrace: st);
      return result;
    }
  }
  /// get unpaid request
  static Future<GetTrainerAllData> getTrainerAllData({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epTrainerData;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetTrainerAllData responseModel = GetTrainerAllData.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetTrainerAllData(status: 500); // Return an error status
    }
  }
  /// GET MONTHLY DATA
  static Future<GetMonthlyData> getMonthlyData({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetMonthlyData;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetMonthlyData responseModel = GetMonthlyData.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel.status}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetMonthlyData(status: 500); // Return an error status
    }
  }
  /// GET WEEKLY DATA
  static Future<GetWeeklyDataModel> getWeeklyData({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetWeeklyData;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetWeeklyDataModel responseModel = GetWeeklyDataModel.fromJson(json);
      if (responseModel.status ==200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetWeeklyDataModel(); // Return an error status
    }
  }
  /// GET WALLET AMOUNT DATA
  static Future<GetWalletAmountModel> getWalletAmount({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetWalletAmount;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetWalletAmountModel responseModel = GetWalletAmountModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetWalletAmountModel(); // Return an error status
    }
  }
  /// GET TODAY NOTIFICATION
  static Future<GetNotificationDataModel> getTodayNotification({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetTodayNotification;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetNotificationDataModel responseModel = GetNotificationDataModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetNotificationDataModel(); // Return an error status
    }
  }
  /// GET YESTERDAY NOTIFICATION
  static Future<GetNotificationDataModel> getYesterdayNotification({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetYesterdayNotification;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetNotificationDataModel responseModel = GetNotificationDataModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetNotificationDataModel(); // Return an error status
    }
  }
  /// GET WEEKLY NOTIFICATION
  static Future<GetNotificationDataModel> getWeeklyNotification({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetWeeklyNotification;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetNotificationDataModel responseModel = GetNotificationDataModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetNotificationDataModel(); // Return an error status
    }
  }
  /// Get RATING FOR TRAINER
  static Future<ReviewAndRatingModel> getReviewForTrainer({required String trainerId}) async {
    try {
      String endPoint = Endpoints.epGetReviewAndRating;
      String fullUrl = "$endPoint$trainerId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      ReviewAndRatingModel responseModel = ReviewAndRatingModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return ReviewAndRatingModel(); // Return an error status
    }
  }
  /// Get ONGOING DETAILS FOR TRAINER
  static Future<GetOngoingDetailsModel> getTrainerOngoingDetails({required String trainerId,required String userId,required String bookingId}) async {
    try {
      String endPoint = Endpoints.epGetTrainerOngoing;
      String fullUrl = "$endPoint?userId=$userId&trainerId=$trainerId&id=$bookingId";
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetOngoingDetailsModel responseModel = GetOngoingDetailsModel.fromJson(json);
      if (responseModel.status == 200) {
        log("CALLING_ENDPOINT: $fullUrl ,RESPONSE:  $json");
        return responseModel;
      } else {
        throw Exception("Error: ${responseModel}");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return GetOngoingDetailsModel(); // Return an error status
    }
  }
}

