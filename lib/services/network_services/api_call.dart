import 'dart:developer';
import 'dart:io';

import 'package:endoorphin_trainer/services/models/response_models/get_category_model.dart';

import '../../custom_Widgets/common_widgets.dart';
import '../models/request_models/login_model.dart';
import '../models/request_models/send_otp_model.dart';
import '../models/request_models/sign_up_model.dart';
import '../models/response_models/get_trainer_doc_status_model.dart';
import 'api_manager.dart';
import 'endpoints.dart';

class CallAPI {
  /// SEND OTP
  static   Future<SentOtpModel> sentOTP({required var request}) async {
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
  static   Future<LoginModel> login({required var request}) async {
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
  static   Future<SignUpModel> uploadUserdata({required var request}) async {
    SignUpModel result = SignUpModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        request: request, endpoint: Endpoints.epSignUp,
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
    } catch (e,st) {
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
      Map<String, dynamic> json = await APIManager().getAllCall(endPoint: fullUrl);
      GetTrainerDocStatusModel responseModel = GetTrainerDocStatusModel.fromJson(json);

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

  /// UPLOAD CERTIFICATE DETAILS (PASSPORT & EMIRATES TYPE)
  static   Future<SignUpModel> uploadPassportAndEmiratesId({required var request}) async {
    SignUpModel result = SignUpModel();
    try {
      Map<dynamic, dynamic> json = await APIManager().postAPICall(
        request: request, endpoint: Endpoints.epSignUp,
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

}
