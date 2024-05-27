import '../../custom_Widgets/common_widgets.dart';
import '../models/request_models/login_model.dart';
import '../models/request_models/send_otp_model.dart';
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





}
