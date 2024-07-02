import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
              color: AppColors.yellow, // assuming AppColors.Yellow is defined somewhere
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

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}



class CertificateCard extends StatelessWidget {
  final String categoryName;
  final String categoryNumber;
  final String documentFrontImg;
  final String documentBackImg;
  final bool isFrontImageVisible;
  final Function onFrontImageTap;
  final Function onBackImageTap;

  const CertificateCard({
    Key? key,
    required this.categoryName,
    required this.categoryNumber,
    required this.documentFrontImg,
    required this.documentBackImg,
    required this.isFrontImageVisible,
    required this.onFrontImageTap,
    required this.onBackImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                alignment: Alignment.center,
                height: 22,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.Black3,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Under verification",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.yellow, fontSize: 10),
                ),
              ).paddingOnly(right: 10),
              Container(
                height: 20,
                width: 25,
                decoration: const BoxDecoration(
                    color: AppColors.yellow, shape: BoxShape.circle),
                child: Image.asset(ImagesPaths.check),
              )
            ],
          ).paddingOnly(bottom: 5),
          Container(
            height: 0.5,
            color: AppColors.grey5,
          ).paddingOnly(bottom: 15, top: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.55,
                height: Get.height * 0.17,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: isFrontImageVisible
                      ? documentFrontImg
                      : documentBackImg,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Certificate Name",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          categoryName,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteShade),
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(bottom: 7),
                        Text(
                          "Certificate Number",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          categoryNumber,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteShade),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ).paddingOnly(left: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => onFrontImageTap(),
                          child: Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.yellow),
                                color: isFrontImageVisible
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                shape: BoxShape.circle),
                            child: Transform.translate(
                              offset: const Offset(-1, 0),
                              child: Image.asset(
                                ImagesPaths.arrowback,
                                scale: 7,
                                color: isFrontImageVisible
                                    ? AppColors.black
                                    : AppColors.yellow,
                                alignment: Alignment.center,
                              ),
                            ),
                          ).paddingOnly(right: 0),
                        ),
                        Container(
                          height: Get.height * 0.025,
                          width: Get.width * 0.12,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            isFrontImageVisible ? 'Front' : 'Back',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ).paddingOnly(left: 1, right: 1),
                        InkWell(
                          onTap: () => onBackImageTap(),
                          child: Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.yellow),
                                color: !isFrontImageVisible
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                shape: BoxShape.circle),
                            child: Transform.translate(
                              offset: const Offset(1, 0),
                              child: Image.asset(
                                ImagesPaths.arrowforword,
                                scale: 7,
                                color: !isFrontImageVisible
                                    ? AppColors.black
                                    : AppColors.yellow,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 7, left: 5),
                  ],
                ),
              ),
            ],
          )
        ],
      ).paddingOnly(top: 5, bottom: 5, right: 15, left: 15),
    ).paddingOnly(bottom: Get.height * 0.02);
  }
}
