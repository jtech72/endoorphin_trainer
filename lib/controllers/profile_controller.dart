import 'dart:developer';
import 'dart:io';
import '../services/models/request_models/category_document_model.dart';
import '../utils/exports.dart';
class ProfileController extends GetxController{
 onLogoutButton() async{
  try{
    Map<String, String> fields = {
      "id":storage.read("userId").toString(),
      "deviceId":"",
      "activeStatus":"false"
    };
    Map<String, File> files = {};
    log("fields = $fields , files = $files ");
    DocumentModel result = await CallAPI.uploadProfileDetails(
      fields: fields,
      files: files,
    );
    if (result.status == 200) {
      dismissLoader();
      storage.erase();
      Get.offAllNamed(AppRoutes.signinoption);
    } else {
      dismissLoader();
      storage.erase();
      Get.offAllNamed(AppRoutes.signinoption);
    }
  }catch(e,st){
    storage.erase();
    Get.offAllNamed(AppRoutes.signinoption);
    log(e.toString(),stackTrace: st);
  }
}
}