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

    // Validation: Check if the trimmed strings are empty or certificate name length is invalid
    if (trimmedCertificateNumber.isEmpty || trimmedCertificateName.isEmpty) {
      showSnackBar(
          "Please enter a ${certificationDetails!["categoryName"] == "Emirates ID"?"Emirates ID Number":certificationDetails!["categoryName"]=="Passport"?'Passport Number':"Certification Number"}and name");
    } else if (trimmedCertificateName.length < 3 ||
        trimmedCertificateName.length > 50) {
      showSnackBar("Certificate name must be atleast 3 characters");
    } else {
      Get.toNamed(AppRoutes.uploadimage, arguments: {
        "userId": certificationDetails!["userId"],
        "categoryName": certificationDetails!["categoryName"],
        "categoryId": certificationDetails!["categoryId"],
        "certificateNumber": trimmedCertificateNumber,
        "certificateName": trimmedCertificateName,
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
