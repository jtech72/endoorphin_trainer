import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/models/request_models/category_document_model.dart';
import '../services/network_services/api_call.dart';

class BioEditController extends GetxController{
  TextEditingController niceNameController = TextEditingController();
  TextEditingController professionalTitleController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController funFactController = TextEditingController();
  TextEditingController motivationController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Future<void> onUpdateButton() async {
    if(niceNameController.text.isEmpty ||
        professionalTitleController.text.isEmpty ||
        experienceController.text.isEmpty){
      showSnackBar("Please fill all the mandatory fields");

    }else{
      showLoader();
      Map<String, String> fields = {
        "id":storage.read("userId").toString(),
        "nickName": niceNameController.text.trim(),
        "professionalTitle": professionalTitleController.text.trim(),
        "yearExperience": experienceController.text.trim(),
        "funFact": funFactController.text.trim(),
        "quote": motivationController.text.trim(),
        "bio": bioController.text.trim(),
      };

      log("fields = $fields ");
      try {
        DocumentModel result = await CallAPI.uploadProfileDetails(
          fields: fields,
          files: {},
        );
        if (result.status == 200) {
          dismissLoader();
          Get.back();
          showSnackBar(result.message.toString());
          log("Successfully uploaded");
        } else {
          dismissLoader();
          showSnackBar(result.message.toString());
          log("Failed to upload");
        }
      } catch (e, st) {
        dismissLoader();
        log(e.toString());
        log(st.toString());
      }
    }


  }

}