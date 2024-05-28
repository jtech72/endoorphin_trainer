import 'dart:developer';

import 'package:endoorphin_trainer/controllers/more_about_you_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';
class MoreAboutYouUi extends StatelessWidget {
   const MoreAboutYouUi({super.key});
   @override
  Widget build(BuildContext context) {
     MoreAboutYouController controller = Get.put(MoreAboutYouController());

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
                FutureBuilder(
                  future: CallAPI.getDocStatus(storage.read("userId").toString()),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ).paddingOnly(top: 20);
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.result!.isEmpty) {
                      return Center(
                        child: Text('No data available'),
                      );
                    }

                    // Combine both lists
                    final combinedList = [
                      ...snapshot.data!.result!.map((result) => {'category': {'name': result.category!.name}}),
                      ...controller.categoryname.map((name) => {'category': {'name': name}}),
                    ];

                    return
                      ListView.builder(
                      itemCount: combinedList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final item = combinedList[index];
                        final categoryName = item['category']!['name'] ?? 'Unknown';

                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (index < snapshot.data!.result!.length) {
                              final userId = snapshot.data!.result![index].userId ?? "";
                              final categoryId = snapshot.data!.result![index].category?.id ?? "";

                              Get.toNamed(AppRoutes.trainerPassport, arguments: {
                                "userId": userId,
                                "categoryName": "",
                                "categoryId": categoryId,
                              });
                            } else {
                              Get.toNamed(AppRoutes.trainerPassport, arguments: {
                                "categoryName": categoryName,

                              });
                            }
                          },
                          child: Container(
                            height: 70,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColors.greyButton,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(-10, 2),
                                      child: Container(
                                        height: Get.width * 0.14,
                                        width: Get.width * 0.14,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 17),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: AppColors.black,
                                        ),
                                        child: Image.asset(
                                          ImagesPaths.document,
                                          height: 24,
                                          width: 24,
                                        ),
                                      ).paddingOnly(left: 20, right: 10, bottom: 5),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * .55,
                                          child: Text(
                                            categoryName,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(color: AppColors.yellow),
                                          ).paddingOnly(top: 12),
                                        ),
                                        Text(
                                          "Upload your Certification ...",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(fontSize: 12),
                                        ).paddingOnly(top: 10),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColors.impgrey,
                                      size: 22,
                                    ).paddingOnly(right: 15),
                                  ],
                                ),
                              ],
                            ).paddingOnly(left: 0),
                          ).paddingOnly(bottom: Get.height * 0.02),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: Get.height*0.02,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Obx(() => Material(
                      type: MaterialType.transparency,
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child:
                          Row(
                            children: [
                              Checkbox(
                                activeColor: AppColors.yellow,
                                checkColor: Colors.black,
                                value: controller.isChecked.value,
                                onChanged: (value) {
                                  controller.isChecked.value = value!;
                                },
                              ),
                              Text('I accept the terms and conditions', style: TextStyle(color: Colors.white,fontSize: 12)),

                            ],

                      ),
                    )),



                    ) ],
                ),
                SizedBox(height: Get.height*0.01),
                Center(child:

                      InkButton(
                      child: Text('Continue',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                            fontFamily: 'Montserrat',
                            ),),
                      onTap: (){
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
