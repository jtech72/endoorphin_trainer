import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';

class TrainerPassportController extends GetxController{
  Map<String, dynamic>? certificationDetails ;
  TextEditingController certificateName = TextEditingController();
  TextEditingController certificateNumber = TextEditingController();

 onFileUpload(){
   if(certificateNumber.text.isEmpty||certificateName.text.isEmpty){
     showSnackBar("Please enter a certificate number and name");
   }else{
     Get.toNamed(AppRoutes.uploadimage,arguments: certificationDetails!["categoryName"]);

   }
 }
  @override
  void onInit() {
    certificationDetails = Get.arguments ?? "";
    log(certificationDetails.toString());
    super.onInit();
  }
}