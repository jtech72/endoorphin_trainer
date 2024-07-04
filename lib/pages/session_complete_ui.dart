import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

class SessionCompleteUI extends StatelessWidget {
  const SessionCompleteUI({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Transform.scale(
                scaleX: 1.1,
                scaleY: 1,
                child: Image.asset(ImagesPaths.bgBlackShade,)),
            Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: AppColors.yellow,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.yellowishWhite,
                      child: Image.asset(ImagesPaths.tick,scale: 1.5,),
                    ),
                  ).paddingOnly(bottom: Get.height*0.02),
                  Text('Session Completed\nsuccessfully',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.yellow),textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.02),
                  RichText(textAlign:TextAlign.center,text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Your session has been successfully completed.",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: '\n Please review the details and ',
                        style: Theme.of(context).textTheme.bodyLarge
                      ),TextSpan(
                        text: 'share your feedback',
                        style: Theme.of(context).textTheme.labelMedium
                      )
                    ]
                  )).paddingOnly(bottom: Get.height*0.15),
                  InkButton(child: Text('View Details',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                      fontFamily: 'Montserrat'),),
                      onTap: (){
                    Get.toNamed(AppRoutes.sessionDetails);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
