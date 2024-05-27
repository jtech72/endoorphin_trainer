import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/exports.dart';
import 'custum_exceptions.dart';
import 'endpoints.dart';

class APIManager {
  String baseUrl = Endpoints.baseUrl;

  /// POST METHOD WITHOUT HEADERS
  Future<Map<dynamic, dynamic>> postAPICall({required Map<String, dynamic> request, required String endpoint}) async {
    var responseJson = {};
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request),
      );

      responseJson = _response(response);
    } on SocketException {
      // Get.toNamed(AppRoutes.noInternet);
      throw FetchDataException('No Internet connection');
    } on HttpException {
      throw FetchDataException('HTTP Exception occurred');
    } catch (e, st) {
      log('Error in API Manager: $e', stackTrace: st);
      // Get.toNamed(AppRoutes.error);
      throw FetchDataException('Unexpected error occurred');
    }
    return responseJson;
  }

  /// GET METHOD WITH HEADER
  Future<dynamic> getAllCall({required String endPoint}) async {
    String newBaseURL = Endpoints.baseUrl;
    Uri urlForGet = Uri.parse("$newBaseURL$endPoint");
    var responseJson = {};
    log("URL For Get is: $urlForGet");
    try {
      final token = storage.read("token");
      log("TOKEN =>  $token");
      final response = await http.get(
        urlForGet,
        headers: {"Authorization": "Bearer $token"},
      );
      responseJson = _response(response);
    } on SocketException {
      // Get.toNamed(AppRoutes.noInternet);
      throw FetchDataException('No Internet connection');
    } catch (e, st) {
      log('Error in API Manager: $e', stackTrace: st);
      // Get.toNamed(AppRoutes.error);
      throw FetchDataException('Unexpected error occurred');
    }
    return responseJson;
  }

  // /// MULTIPART REQUEST
  // Future<ResisterUserModel> registerUser({
  //   required String userName,
  //   required String password,
  //   required String email,
  //   required String phoneNumber,
  //   required String role,
  // }) async {
  //   printResult(
  //       screenName: "APIMANAGER",
  //       msg: "DATA FOR POST $userName $password $email $role $phoneNumber");
  //   var url = Uri.parse('${Endpoints.baseUrl}${Endpoints.epRegister}');
  //   var request = http.MultipartRequest('POST', url);
  //
  //   request.fields['userName'] = userName;
  //   request.fields['password'] = password;
  //   request.fields['email'] = email;
  //   request.fields['role'] = role;
  //   request.fields['phoneNumber'] = phoneNumber;
  //
  //   try {
  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);
  //
  //     if (response.statusCode == 200) {
  //       return ResisterUserModel.fromJson(json.decode(response.body));
  //     } else {
  //       Get.toNamed(AppRoutes.error);
  //       throw FetchDataException('Failed to register user with StatusCode: ${response.statusCode}');
  //     }
  //   } catch (e, st) {
  //     printResult(screenName: "API MANAGER", error: e.toString(), stackTrace: st, msg: "");
  //     Get.toNamed(AppRoutes.error);
  //     throw Exception('Failed to register user: $e');
  //   }
  // }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
