import 'dart:developer';

import 'package:endoorphin_trainer/controllers/more_about_you_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/exports.dart';

class MoreAboutYouUi extends StatelessWidget {
  // List<String>categoryname=['Emirates ID','Passport','Certification'];


   const MoreAboutYouUi({super.key});

  @override
  Widget build(BuildContext context) {
    MoreAboutYouController controller = Get.find();
    return Scaffold(
      appBar: myAppBar(title: Transform.translate(
          offset: Offset(0,-3),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
              child: Image.asset(ImagesPaths.logoimg,height: 36,width: 146,))), context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPaths.bgBlackShade),
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload your Documents",
                  style: Theme.of(context).textTheme.headlineSmall,
                ).paddingOnly(top: Get.height*.02,bottom: Get.height*.02),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.displayLarge,
                ).paddingOnly(top: Get.height*.02,bottom: Get.height*.02),
                Container(
                  height: Get.height*0.26,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.greyButton,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView.builder(padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImagesPaths.cooltick1,height: 20,width: 20,).paddingOnly(right: 15),
                          Expanded(
                            child: Text(
                              controller.item[index],
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: Get.width*0.06,right: Get.width*0.02,top: Get.height*0.02,bottom: Get.height*0.01);
                    },
                  ),
                ).paddingOnly(top: Get.height*.01),
                SizedBox(
                  height: Get.height*0.03,
                ),
                Container(
                 color: Colors.transparent,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context,index){
                    return InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          controller.selectedIndex.value = index;
                            Get.toNamed(AppRoutes.trainerPassport,arguments: index);
                          // Use Get.toNamed to navigate to the desired routes based on the selected index
                          // if (controller.selectedIndex.value == 0) {
                          //   controller.isButtonVisible.value = true;
                          //   Get.toNamed(AppRoutes.trainerPassport,);
                          // } else if (controller.selectedIndex.value == 1) {
                          //   controller.isButtonVisible.value = true;
                          //   log(controller.isButtonVisible.value.toString());
                          //   Get.toNamed(AppRoutes.trainerPassport);
                          // } else {
                          //   controller.isButtonVisible.value = true;
                          //   Get.toNamed(AppRoutes.trainerPassport);
                          // }
                        },
                        child: Container(
                          height: 70,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.greyButton,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.translate(
                                    offset: Offset(-10,2),
                                    child: Container(
                                      height: Get.width*0.14,
                                      width: Get.width*0.14,
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.black,
                                      ),
                                       child: Image.asset(ImagesPaths.document,height: 24,width: 24,),
                                    ).paddingOnly(left: 20,right: 10,bottom: 5),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                            
                                          width: Get.width*.55,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            index==0||index == 1?controller.newList[index]:"${controller.newList[index]} Certification",style:Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellow),).paddingOnly(top: 12)),
                                      Text(index ==0?"Upload your Emirates ID ...":index ==1?"Upload your passport ...":"Upload your Certification ...",style:Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),).paddingOnly(top: 10),
                            
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.impgrey,size: 22).paddingOnly(right: 15),
                                ],
                              ),
                            ],
                          ).paddingOnly(left: 0),
                        ).paddingOnly(bottom: Get.height*0.02),
                      );
                            
                  },itemCount: controller.newList.length,)
                ),
                            
                Center(child:

                      InkButton(
                      child: Text('Continue',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                            fontFamily: 'Montserrat',
                            ),),
                      onTap: (){
                      Get.back(result: true);
                      Get.toNamed(AppRoutes.bio)?.then((result) {
                        if (result != null && result == true) {
                          controller.showButton(true); // Show the button when returning from another page
                        }
                      });
                      }),
                ),
                            SizedBox(height: Get.height*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
