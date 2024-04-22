import 'dart:developer';

import 'package:endoorphin_trainer/controllers/more_about_you_controller.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';

class MoreAboutYouUi extends StatelessWidget {
  // List<String>categoryname=['Emirates ID','Passport','Certification'];


   const MoreAboutYouUi({super.key});

  @override
  Widget build(BuildContext context) {
    MoreAboutYouController controller = Get.find();
    return Scaffold(
     appBar: AppBar(
       toolbarHeight: 50,
       leadingWidth: Get.width * 0.17,
        automaticallyImplyLeading: false,centerTitle: false,
        title: Text('Upload your Documents',style: Theme.of(context).textTheme.headlineSmall,),
      ),
     // appBar: myAppBar(title: Text('Upload your Documents',style: Theme.of(context).textTheme.headlineSmall,), context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: ListView.builder(
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
                  ).paddingOnly(left: 22,right: 15,top: 15,bottom: 22);
                },
              ),
            ).paddingOnly(top: Get.height*.01),
            SizedBox(
              height: Get.height*0.03,
            ),
            Container(
              height: Get.height*0.33,

             color: AppColors.black,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                return InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      controller.selectedIndex.value = index;
                        controller.isButtonVisible.value = true;
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
                                  height: 59,
                                  width: 59,
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
                                  Text(controller.categoryname[index],style:Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellow),).paddingOnly(top: 12),
                                  Text(controller.categorysubname[index],style:Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),).paddingOnly(top: 10),

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

              },itemCount: controller.categoryname.length,)
            ),

            Center(child: Obx(
              ()=> Visibility(
                visible: controller.isButtonVisible.value,
                child: InkButton(
                    child: Text('Continue',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                    onTap: (){
                    Get.back(result: true);
                    Get.toNamed(AppRoutes.bio)?.then((result) {
                      if (result != null && result == true) {
                        controller.showButton(true); // Show the button when returning from another page
                      }
                    });
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
