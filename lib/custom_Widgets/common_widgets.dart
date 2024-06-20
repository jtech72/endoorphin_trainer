import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

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

// Drawer myDrawer() {
//   return Drawer(
//
//     surfaceTintColor: Colors.red,
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//           child: Text('Drawer Header'),
//         ),
//         ListTile(
//           selected: true, // Set to true when tile is selected
//           selectedTileColor: AppColors.yellow, // Background color when tile is selected
//           tileColor: AppColors.yellow, // Background color when tile is not selected (to maintain the color)
//           iconColor: Colors.white, // Icon color
//           title: InkWell(
//             onTap: () {
//               // Add your onTap logic here
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: Colors.white), // Set icon color to white
//                 SizedBox(width: Get.width * 0.05),
//                 Text('Drawer Header', style: TextStyle(color: Colors.white)), // Set text color to white
//               ],
//             ),
//           ),
//         ),
//
//         ListTile(
//           selected: true, // Set to true when tile is selected
//           selectedTileColor: AppColors.yellow, // Background color when tile is selected
//           tileColor: AppColors.yellow, // Background color when tile is not selected (to maintain the color)
//           iconColor: Colors.white, // Icon color
//           title: InkWell(
//             onTap: () {
//               // Add your onTap logic here
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: Colors.white), // Set icon color to white
//                 SizedBox(width: Get.width * 0.05),
//                 Text('Drawer Header', style: TextStyle(color: Colors.white)), // Set text color to white
//               ],
//             ),
//           ),
//         ),
//         ListTile(
//           selectedColor:AppColors.yellow ,
//           title: InkWell(
//             onTap: () {
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: AppColors.impgrey,),
//                 SizedBox(width: Get.width * 0.05,),
//                 Text('Drawer Header', style: Theme.of(Get.context!).textTheme.titleLarge),
//               ],
//             ),
//           ),
//         ),
//         ListTile(
//           selectedColor:AppColors.yellow ,
//           title: InkWell(
//             onTap: () {
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: AppColors.impgrey,),
//                 SizedBox(width: Get.width * 0.05,),
//                 Text('Drawer Header', style: Theme.of(Get.context!).textTheme.titleLarge),
//               ],
//             ),
//           ),
//         ),
//         ListTile(
//           selectedColor:AppColors.yellow ,
//           title: InkWell(
//             onTap: () {
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: AppColors.impgrey,),
//                 SizedBox(width: Get.width * 0.05,),
//                 Text('Drawer Header', style: Theme.of(Get.context!).textTheme.titleLarge),
//               ],
//             ),
//           ),
//         ),
//         ListTile(
//           selectedColor:AppColors.yellow ,
//           title: InkWell(
//             onTap: () {
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: AppColors.impgrey,),
//                 SizedBox(width: Get.width * 0.05,),
//                 Text('Drawer Header', style: Theme.of(Get.context!).textTheme.titleLarge),
//               ],
//             ),
//           ),
//         ),
//         ListTile(
//           selectedColor:AppColors.yellow ,
//           title: InkWell(
//             onTap: () {
//             },
//             child: Row(
//               children: [
//                 Image.asset(ImagesPaths.home, scale: 5, color: AppColors.impgrey,),
//                 SizedBox(width: Get.width * 0.05,),
//                 Text('Drawer Header', style: Theme.of(Get.context!).textTheme.titleLarge),
//               ],
//             ),
//           ),
//         ),
//
//
//
//       ],
//     ),
//   );
// }
