import 'package:endoorphin_trainer/controllers/withdraw_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class WithdrawUI extends StatelessWidget {

   const WithdrawUI({super.key,});

  @override
  Widget build(BuildContext context) {
    WithdrawController controller = Get.put(WithdrawController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: myAppBar(
     //     title: Text('Withdraw',
     //       style: Theme.of(context).textTheme.headlineSmall,),
     //     context: context
     // ),
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          SingleChildScrollView(
            child: Obx(
              ()=> Column(
                children: [
                  SizedBox(height: Get.height*0.075,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(Icons.arrow_back_ios,size: 18,).paddingOnly(right: Get.width*0.02)),
                      ),
                      Text('Withdraw',
                        style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ).paddingOnly(left: Get.width*0.08,bottom: Get.height*0.03),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 71,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.greyButton,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Balance',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
                            Text('AED2648.00',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500,color: AppColors.yellow),),
                          ],
                        ).paddingOnly(right: Get.width*0.05,left: Get.width*0.05),
                      ),
                      SizedBox(
                        height: Get.height*0.02,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              controller.selectedIndex.value=0;
                            },
                            child: Container(
                              height: 31,
                              width: 84,
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value==0? AppColors.yellow:Colors.transparent,
                                border: Border.all(color:controller.selectedIndex.value==0? AppColors.yellow:AppColors.yellow),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text('Unpaid',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:controller.selectedIndex.value==0? AppColors.black:AppColors.yellow),)),
                            ),
                          ),
                          SizedBox(width: Get.width*0.1,),
                          GestureDetector(
                            onTap: (){
                              controller.selectedIndex.value=1;
                            },
                            child: Container(
                              height: 31,
                              width: 84,
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value==1? AppColors.yellow: AppColors.black,
                                  border: Border.all(color: AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text('Paid',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:controller.selectedIndex.value==1? AppColors.black:AppColors.yellow),)),
                            ),
                          ),
                         ],
                      ).paddingOnly(bottom: Get.height*0.02)
                    ],
                      ).paddingOnly(left: Get.width*0.02,right: Get.width*0.02),
                  controller.selectedIndex.value==0?

                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.lightyGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                          () => Checkbox(
                                            checkColor: AppColors.yellow,activeColor: Colors.transparent,
                                            side: const BorderSide(
                                                color: AppColors.grey3,width: 2
                                            ),
                                        value: controller.isChecked1.value,
                                        onChanged: (value) {
                                          controller.toggleCheckbox1();
                                        },
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        Text('Yoga session with Richard'),
                                        Text('21 Dec . 1.39 pm '),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text('AED 500'),
                              ],
                            ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.lightyGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                          () => Checkbox(
                                            checkColor: AppColors.yellow,activeColor: Colors.transparent,
                                            side: const BorderSide(
                                                color: AppColors.grey3,width: 2
                                            ),
                                        value: controller.isChecked2.value,
                                        onChanged: (value) {
                                          controller.toggleCheckbox2();
                                        },
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        Text('Yoga session with Richard'),
                                        Text('21 Dec . 1.39 pm '),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text('AED 700'),
                              ],
                            ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.lightyGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                          () => Checkbox(checkColor: AppColors.yellow,activeColor: Colors.transparent,
                                            side: const BorderSide(
                                            color: AppColors.grey3,width: 2
                                          ),
                                        value: controller.isChecked3.value,
                                        onChanged: (value) {
                                          controller.toggleCheckbox3();
                                        },
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        Text('Yoga session with Richard'),
                                        Text('21 Dec . 1.39 pm '),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text('AED 900'),
                              ],
                            ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.lightyGrey,
                            ),
                          ],
                        ).paddingOnly(bottom: Get.height*0.35),
                        InkButton(
                            child: Text('Sent Request',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.Black3,
                                    title: Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.03,
                                        ),
                                        Image.asset(
                                          ImagesPaths.cooltick,
                                          scale: 4,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),

                                      ],
                                    ),
                                    content: SizedBox(
                                        width: Get.width,
                                        height: Get.height * 0.07,
                                        child: Text(
                                          "Your Request has been sent\nsuccessfully. You will be notified\nshortly",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(fontWeight: FontWeight.w400,color: AppColors.white),
                                          textAlign: TextAlign.center,
                                        )),
                                    actions: [
                                      Center(
                                        child: InkButton(
                                            child: Text(
                                              'OK',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(color: AppColors.black),
                                            ),
                                            onTap: () {
                                              Get.offAllNamed(AppRoutes.bottomNavigation);
                                            },
                                            height: 35,
                                            width: 95),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                    ],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  );
                                },
                              );

                            })
                      ],
                    )
                  ).paddingOnly():
                  SizedBox(
                      height: Get.height*.4,
                      width: Get.width,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.lightyGrey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('Yoga session with Richard'),
                                      Text('21 Dec . 1.39 pm '),
                                    ],
                                  ),
                                ],
                              ),
                               Text('AED 500'),
                            ],
                          ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.lightyGrey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('Yoga session with Richard'),
                                      Text('21 Dec . 1.39 pm '),
                                    ],
                                  ),
                                ],
                              ),
                               Text('AED 700'),
                            ],
                          ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.lightyGrey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                   Column(
                                    children: [
                                      Text('Yoga session with Richard'),
                                      Text('21 Dec . 1.39 pm '),
                                    ],
                                  ),
                                ],
                              ),
                               Text('AED 900'),
                            ],
                          ).paddingOnly(right: Get.width*0.03,top: Get.height*.01,bottom: Get.height*.01),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.lightyGrey,
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            ),
        ],
      ));
}}

