import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';

class TrainerPassportController extends GetxController {
  Map<String, dynamic>? certificationDetails;
  TextEditingController certificateName = TextEditingController();
  TextEditingController certificateNumber = TextEditingController();

  onFileUpload() {
    // Trim the input to remove leading and trailing whitespace
    String trimmedCertificateNumber = certificateNumber.text.trim();
    String trimmedCertificateName = certificateName.text.trim();

    // Validation: Check if the trimmed certificate number is empty
    if (trimmedCertificateName.isEmpty) {
      showSnackBar("Please enter a ${certificationDetails!["categoryName"] == "emirates" ? "Emirates ID Name" : certificationDetails!["categoryName"] == "passport" ? "Passport Name" : "certification name"}");
      showSnackBar("Please enter a ${certificationDetails!["categoryName"] == "emirates" ? "Emirates ID Name" : certificationDetails!["categoryName"] == "passport" ? "Passport Name" : " certification name"}");
    }
    // Validation: Check if the trimmed certificate name is empty
    else if (trimmedCertificateNumber.isEmpty) {
      showSnackBar("Please enter a ${certificationDetails!["categoryName"] == "emirates" ? "Emirates ID Number" : certificationDetails!["categoryName"] == "passport" ? "Passport Number" : "certification number"}");
    }
    // Validation: Check if the certificate name length is invalid
    else if (trimmedCertificateName.length < 3 ) {
      showSnackBar("Certificate name must be at least 3 characters");
    }else if (trimmedCertificateNumber.length < 5) {
      showSnackBar("Certificate number must be at least 5 characters");
    }
    // If all validations pass, navigate to the upload image screen
    else {
      Get.toNamed(AppRoutes.uploadimage, arguments: {
        "userId": certificationDetails!["userId"],
        "categoryName": certificationDetails!["categoryName"],
        "categoryId": certificationDetails!["categoryId"],
        "id": certificationDetails!["id"],
        "certificateNumber": trimmedCertificateNumber,
        "certificateName": trimmedCertificateName,
        "reupload": certificationDetails!["reupload"],
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    certificationDetails = Get.arguments;
    log(certificationDetails.toString());
  }
}
