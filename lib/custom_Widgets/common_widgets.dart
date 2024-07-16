import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/exports.dart';

GetStorage storage=GetStorage();

void printResult({
  required String screenName,
  String? msg,
  String? error,
  StackTrace? stackTrace,
}) {
  log(
    msg!,
    name: screenName,
    error: error,
    stackTrace: stackTrace,
  );
}

void showSnackBar(message) {
  Get.snackbar(
      duration: const Duration(seconds: 6),
      colorText: AppColors.black,
      AppStrings.appName,
      "${message ?? "Something went wrong Status Code"}",
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.yellow);
}

Widget InkButton({
  double? borderRadius,
  double? height,
  double? width,
  Color? backGroundColor ,
  Color? rippleColor,
  required Widget child,
  required Function onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(borderRadius ?? 36),
    color: backGroundColor?? AppColors.yellow,
    child: InkWell(
      splashColor: rippleColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      onTap: () {
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        } else {
          onTap();
        }
      },
      child: Container(
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: AppColors.yellow,)
          ),
          alignment: Alignment.center,
          height: height ??
              // 50,
              Get.height*0.05,
          width: width ??
              // 300,
              Get.width*0.7,
          child: child),
    ),
  );
}




AppBar myAppBar({
  Color?backGroundColor,
  List<Widget>? action,
  required Widget title,
  required BuildContext context,

}) {
  return AppBar(
    toolbarHeight: 50,
    leadingWidth: Get.width * 0.17,
    centerTitle: false,
    leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child:  Container(color: Colors.transparent,
            height: 30,
            width: 40,
            child: const Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.white,size: 18,))),
    title: title,
    surfaceTintColor: Colors.transparent,
    backgroundColor: backGroundColor??AppColors.black,
    elevation: 3,
    titleSpacing: -10,
    actions: action,
  );
}
//SHOW LOADER
showLoader({Color color =AppColors.yellow, double? topMargin = 0,}) {
  showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Transform.translate(
              offset: Offset(0, -topMargin!),
              child: Container(
                  width: Get.width,
                  height: Get.height,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: SpinKitCircle(
                    color: color,
                    size: 70.0,
                  )),
            ));
      });
}



//DISMISS LOADER
void dismissLoader() {
  log("Loader has been closed");
  Get.back();
}

 UploadImage? uploadImage;
enum UploadImage{
  byInitically,
  byProfile
}
OtpVerified? otpVerified;
enum OtpVerified{
  byNumber,
  byMail
}


Widget buildOption(IconData icon, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.yellow,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.Black3),
          ).paddingOnly(bottom: 5),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
//
class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
class CertificateNumberFormatter extends TextInputFormatter {
  final int maxLength;

  CertificateNumberFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final cleanText = newValue.text.replaceAll('-', '');
    final truncatedText = cleanText.substring(0, cleanText.length <= maxLength ? cleanText.length : maxLength);
    final buffer = StringBuffer();
    int selectionIndex = truncatedText.length;
    for (int i = 0; i < truncatedText.length; i++) {
      if (i == 3 || i == 7 || i == 14 || i == 15) {
        buffer.write('-');
        if (i < selectionIndex) selectionIndex++;
      }
      buffer.write(truncatedText[i]);
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

/// UPLOADED DOC CLASS
class TrainerDocumentStatusCard extends StatelessWidget {
  final String categoryName;
  final String categoryMainName;
  final String docName;
  final String docNumber;
  final String categoryNumber;
  final String documentFrontImg;
  final String documentBackImg;
  final String approveStatus;
  final String? remark;
  final String? comment;
  final void Function()? onReuploadTap;
  final bool isFrontImageVisible;

  TrainerDocumentStatusCard({
    required this.categoryName,
    required this.docName,
    required this.docNumber,
    required this.categoryMainName,
    required this.categoryNumber,
    required this.documentFrontImg,
    required this.documentBackImg,
    required this.approveStatus,
    this.remark,
    this.comment,
    this.onReuploadTap,
    this.isFrontImageVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    var isFrontImageVisible = true.obs;
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.greyButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildDivider(),
          _buildBody(context, isFrontImageVisible),
          if (remark != null) _buildRemarkSection(context),
        ],
      ).paddingOnly(bottom: 15, top: 15, right: 15, left: 15),
    ).paddingOnly(bottom: 15);
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryMainName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.yellow),
        ),
        _buildApprovalStatus(),
      ],
    ).paddingOnly(bottom: Get.height * 0.01);
  }

  Widget _buildApprovalStatus() {
    switch (approveStatus) {
      case "approved":
        return _buildApprovedStatus();
      case "pending":
        return _buildPendingStatus();
      case "rejected":
        return _buildRejectedStatus();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildApprovedStatus() {
    return Row(
      children: [
        Container(
          height: 22,
          width: 64,
          decoration: BoxDecoration(color: AppColors.Black3, borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text('Approved', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.green)),
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.yellow,
          radius: 11,
          child: Image.asset(ImagesPaths.checktick, width: 22),
        ).paddingOnly(left: 10),
      ],
    );
  }

  Widget _buildPendingStatus() {
    return Row(
      children: [
        Container(
          height: 22,
          width: 100,
          decoration: BoxDecoration(color: AppColors.Black3, borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text('Under verification', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.yellow)),
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.yellow,
          radius: 11,
          child: Image.asset(ImagesPaths.check, width: 22),
        ).paddingOnly(left: 10),
      ],
    );
  }

  Widget _buildRejectedStatus() {
    return Row(
      children: [
        Container(
          height: 22,
          width: 64,
          decoration: BoxDecoration(color: AppColors.Black3, borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text('Rejected', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.red)),
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.yellow,
          radius: 11,
          child: Image.asset(ImagesPaths.checkcross, width: 22),
        ).paddingOnly(left: 10),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: Get.width,
      color: AppColors.lightyGrey,
    ).paddingOnly(bottom: Get.height * 0.02);
  }

  Widget _buildBody(BuildContext context, RxBool isFrontImageVisible) {
    return Row(
      children: [
        Flexible(
          child: Obx(() => SizedBox(
            height: 131,
            width: 204,
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: isFrontImageVisible.value ? documentFrontImg : documentBackImg,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(value: downloadProgress.progress),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCertificationInfo(context),
            _buildFrontBackToggle(context, isFrontImageVisible),
          ],
        ).paddingOnly(left: Get.width * 0.04),
      ],
    );
  }

  Widget _buildCertificationInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(docName, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)).paddingOnly(bottom: 2),
        Container(
            width: 120,
            child: Text(categoryName, style: Theme.of(context).textTheme.labelSmall!.copyWith(color:AppColors.lightGrey)).paddingOnly(bottom: 8)),
        Text(docNumber, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)).paddingOnly(bottom: 2),
        Text(categoryNumber, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey)).paddingOnly(bottom: 2),
      ],
    );
  }

  Widget _buildFrontBackToggle(BuildContext context, RxBool isFrontImageVisible) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildToggleIcon(true, isFrontImageVisible),
        _buildFrontBackLabel(context, isFrontImageVisible),
        _buildToggleIcon(false, isFrontImageVisible),
      ],
    ).paddingOnly(top: 7, left: 5));
  }

  Widget _buildToggleIcon(bool isFront, RxBool isFrontImageVisible) {
    return InkWell(
      onTap: () {
        isFrontImageVisible.value = isFront;
      },
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.yellow),
          color: isFrontImageVisible.value == isFront ? AppColors.yellow : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Transform.translate(
          offset: Offset(isFront ? -1 : 1, 0),
          child: Image.asset(
            isFront ? ImagesPaths.arrowback : ImagesPaths.arrowforword,
            scale: 7,
            color: isFrontImageVisible.value == isFront ? AppColors.black : AppColors.yellow,
            alignment: Alignment.center,
          ),
        ),
      ).paddingOnly(right: isFront ? 10 : 0, left: isFront ? 0 : 10),
    );
  }

  Widget _buildFrontBackLabel(BuildContext context, RxBool isFrontImageVisible) {
    return Container(
      height: Get.height * 0.025,
      width: Get.width * 0.12,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        isFrontImageVisible.value ? 'Front' : 'Back',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    ).paddingOnly(left: 1, right: 1);
  }

  Widget _buildRemarkSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Rejection Reason",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
            ),
            GestureDetector(
              onTap: onReuploadTap,
              child: Container(
                height: 24,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.yellow),
                ),
                child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Reupload",
                        style: TextStyle(color: AppColors.yellow,fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                      Image.asset(ImagesPaths.upload,color: AppColors.yellow,scale: 8,)
                    ],
                  ),
                ),
              ).paddingOnly(left: 7),
            ),
          ],
        ).paddingOnly(top: Get.height*0.01),
        Text(
          remark ?? '',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.lightGrey),
        ),
        Text(
          comment ?? '',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }
}
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.yellow,
    textColor: AppColors.black,
    fontSize: 14.0,
  );
}