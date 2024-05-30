import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/exports.dart';
import 'custum_exceptions.dart';
import 'endpoints.dart';
import 'package:http_parser/http_parser.dart';

class APIManager {
  String baseUrl = Endpoints.baseUrl;

  /// POST METHOD WITHOUT HEADERS
  Future<Map<dynamic, dynamic>> postAPICall({required Map<String, dynamic> request, required String endpoint}) async {
    var responseJson = {};
    try {
      log('Request Body: ${jsonEncode(request)}');
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {"Content-Type": "application/json"},

        body: jsonEncode(request),
      );

      responseJson = _response(response);
    } on SocketException {
      Get.toNamed(AppRoutes.error);
      throw FetchDataException('No Internet connection');
    } on HttpException {
      throw FetchDataException('HTTP Exception occurred');
    } catch (e, st) {
      log('Error in API Manager: $e', stackTrace: st);
      log('Error in API Manager: $st');
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


  Future<Map<String, dynamic>> postAPICallWithoutHeaders({
    required String endPoint,
    required Map<String, dynamic> request,
  }) async {
    Uri urlForPut = Uri.parse("${Endpoints.baseUrl}$endPoint");

    log("Calling API: $urlForPut");
    log("Calling Request: $request");

    Map<String, dynamic> responseJson = {};

    try {
      final response = await http.post(
        urlForPut,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: request.map((key, value) => MapEntry(key, value.toString())),
      );

      log("Response Body: ${response.body}");

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e, st) {
      log('Error: $e');
      log('ST: $st');
    }

    return responseJson;
  }


// MULTIPART REQUEST

  Future<Map<String, dynamic>> putMultipartAPICall({required String endPoint, required Map<String, String> fields, required Map<String, File> files,}) async {
    Uri urlForPut = Uri.parse("${Endpoints.baseUrl}$endPoint");

    log("Calling API: $urlForPut");

    Map<String, dynamic> responseJson = {};

    try {
      final request = http.MultipartRequest('PUT', urlForPut);

      // Add fields to the request
      fields.forEach((key, value) {
        request.fields[key] = value;
      });

      // Add files to the request
      for (var entry in files.entries) {
        final multipartFile = await buildMultipartFileFromFile(entry.key, entry.value);
        request.files.add(multipartFile);
      }

      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      responseJson = _response(http.Response(responseString, response.statusCode));
    } on SocketException {
      // Get.back();
      // showSnackBar("", "Internet not available");
      throw FetchDataException('No Internet connection');
    } on Error catch (e, st) {
      log('Error: $e');
      log('ST: $st');
    }

    return responseJson;
  }
  Future<http.MultipartFile> buildMultipartFileFromFile(String fieldName, File file) async {
    return http.MultipartFile(
      fieldName, // Field name for the file
      file.openRead(),
      await file.length(),
      filename: file.path.split('/').last, // You can customize the filename here
    );
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);

        // throw BadRequestException(response.body.toString());
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
