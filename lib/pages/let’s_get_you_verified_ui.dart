import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class LetGetYouVerifiedUi extends StatelessWidget {
  const LetGetYouVerifiedUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Let’s get you verified',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 16),
          ).paddingOnly(left: 15),
          centerTitle: false,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: Theme.of(context).textTheme.displayLarge,
              ).paddingOnly(top: Get.height * .02),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.grey,
              ).paddingOnly(
                top: 25,
                bottom: 25,
              ),
              Container(
                height: 78,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.greyButton,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.black,
                          ),
                          child: Image.asset(ImagesPaths.document,width: 18,),
                        ).paddingOnly(left: 20,right: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Visa",style:Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellow),).paddingOnly(top: 12),
                            Text("Upload your visa ...",style:Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),).paddingOnly(top: 10),

                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.impgrey,).paddingOnly(right: 15)
                      ],
                    )
                  ],
                ),
              ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.trainerPassport);
                    },
                    child: Container(
                      height: 78,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.greyButton,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.black,
                                ),
                                child: Image.asset(ImagesPaths.document,width: 18,),
                              ).paddingOnly(left: 20,right: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Passport",style:Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellow),).paddingOnly(top: 12),
                                  Text("Upload your visa ...",style:Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),).paddingOnly(top: 10),

                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.impgrey,).paddingOnly(right: 15)
                            ],
                          )
                        ],
                      ),
                    ).paddingOnly(top: 25,bottom: 25),
                  ),
                  Container(
                    height: 78,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: AppColors.greyButton,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.black,
                              ),
                              child: Image.asset(ImagesPaths.document,width: 18,),
                            ).paddingOnly(left: 20,right: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Emirates ID",style:Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellow),).paddingOnly(top: 12),
                                Text("Upload your visa ...",style:Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),).paddingOnly(top: 10),

                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.impgrey,).paddingOnly(right: 15)
                          ],
                        )
                      ],
                    ),
                  ),
            ])));
  }
}
