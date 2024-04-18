import 'package:endoorphin_trainer/controllers/withdraw_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class WithdrawUI extends StatelessWidget {

   const WithdrawUI({super.key,});

  @override
  Widget build(BuildContext context) {
    WithdrawController controller = Get.put(WithdrawController());
    return Scaffold(
     appBar: myAppBar(
         title: Text('Withdraw',
           style: Theme.of(context).textTheme.headlineSmall,),
         context: context
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    Container(
                      height: 31,
                      width: 84,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.yellow),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text('Unpaid',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.yellow),)),
                    ),
                    SizedBox(width: Get.width*0.1,),
                    Container(
                      height: 31,
                      width: 84,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                          border: Border.all(color: AppColors.yellow),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text('Paid',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),)),
                    ),
                   ],
                ).paddingOnly(bottom: Get.height*0.02)
              ],
                ).paddingOnly(left: Get.width*0.02,right: Get.width*0.02),
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
                              Text('Another session'),
                              Text('Some other time'),
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
                              Text('Yet Another session'),
                              Text('Some other time'),
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
              )
            ).paddingOnly(),
            InkButton(
                width: Get.width*0.4,
                child: Text('Withdraw Request',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
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
                                  .copyWith(fontWeight: FontWeight.w400,color: AppColors.black),
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
                                  Get.offAllNamed(AppRoutes.home);
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
        ),
  ));
}}

