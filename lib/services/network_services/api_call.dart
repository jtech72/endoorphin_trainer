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
import '../models/response_models/get_session_detail_model.dart';
import '../models/response_models/get_trainer_doc_status_model.dart';
import '../models/response_models/get_unpaid_withdraw_model.dart';
import '../models/response_models/profile_detail_model.dart';
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
      String fullUrl = "$endPoint?id=$trainerId";
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
        endpoint: Endpoints.epPostReviewUser,
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

}

