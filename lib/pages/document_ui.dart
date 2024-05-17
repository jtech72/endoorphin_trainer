import 'package:endoorphin_trainer/controllers/document_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

class DocumentUI extends StatelessWidget {
  const DocumentUI({super.key});

  @override
  Widget build(BuildContext context) {
    DocumentController controller = Get.put(DocumentController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: myAppBar(
      //     title: Text('Documents',
      //       style: Theme.of(context).textTheme.bodyMedium,),
      //     context: context
      // ),

      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text('Documents',
                      style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ).paddingOnly(left: Get.width*0.082,bottom: Get.height*0.02),
                Transform.translate(
                    offset: Offset(10,0),
                    child: Text('Uploaded Documents',style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(bottom: Get.height*0.03)),
                ListView.builder(padding: EdgeInsets.zero,
                  shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 215,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.greyButton,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.newList[index],style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.yellow),),
                                  Row(
                                    children: [
                                      InkButton(borderRadius: 5,
                                          backGroundColor: AppColors.black,
                                          height: 22,
                                          width: 52,
                                          child: Text('SAVED',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),), onTap: (){}).paddingOnly(right: Get.width*0.03),
                                      CircleAvatar(
                                        backgroundColor: AppColors.yellow,
                                        radius: 11,
                                        child: Image.asset(ImagesPaths.tick,color: AppColors.black,width: 12,),
                                      )
                                    ],
                                  ),
                                ],
                              ).paddingOnly(bottom: Get.height*0.01),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: AppColors.lightyGrey,
                              ).paddingOnly(bottom: Get.height*0.02),
                              Row(
                                children: [
                                  Container(
                                    height: 131,
                                    width: 204,
                                    child: Image.asset(ImagesPaths.passportPhoto),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Institute  Name',style: Theme.of(context).textTheme.labelMedium,).paddingOnly(bottom: 2),
                                      Text('john abc',style: Theme.of(context).textTheme.labelSmall,).paddingOnly(bottom: 8),
                                      Text('Certification Year',style: Theme.of(context).textTheme.labelMedium,).paddingOnly(bottom: 2),
                                      Text('john abc',style: Theme.of(context).textTheme.labelSmall,),
                                      SizedBox(
                                        height: Get.height*0.02,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 27,
                                            width: 27,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.yellow,width: 1),
                                              borderRadius: BorderRadius.circular(40)
                                            ),
                                            child: Image.asset(ImagesPaths.trash,scale: 4,),
                                          ).paddingOnly(right: Get.width*0.05),
                                          Container(
                                            height: 27,
                                            width: 27,
                                            decoration: BoxDecoration(
                                                color: AppColors.yellow,
                                                borderRadius: BorderRadius.circular(40)
                                            ),
                                            child: Image.asset(ImagesPaths.pencil,scale: 4,),
                                          ),
                                        ],
                                      )
                                    ],
                                  ).paddingOnly(left: Get.width*0.04)
                                ],
                              )
                            ],
                          ).paddingAll(15),
                        ),
                      );
                    },itemCount:  controller.newList.length,
                ),
              ],
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: 95,
      //         width: Get.width,
      //         decoration: BoxDecoration(
      //           color: AppColors.greyButton,
      //           borderRadius: BorderRadius.circular(10),
      //           border: Border.all(color: AppColors.grey3)
      //         ),
      //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text('Visa',style: Theme.of(context).textTheme.labelMedium,).paddingOnly(bottom: 5),
      //             Stack(
      //               children: [
      //                 Image.asset(ImagesPaths.pdf,scale: 4,),
      //                 Positioned(
      //                     right: 0,
      //                     bottom: 23,
      //                     child: Image.asset(ImagesPaths.crosspdf,scale: 4,))
      //               ],
      //             ),
      //           ],
      //         ).paddingOnly(left: 15,top: 15),
      //       ).paddingOnly(bottom: Get.height*0.02),
      //       Text('Visa',
      //         style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
      //       SizedBox(
      //         height: Get.height*0.01,
      //       ),
      //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             height: 45,
      //             width: Get.width*0.78,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: AppColors.lightWhite),
      //               shape: BoxShape.rectangle,
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: TextField(
      //               inputFormatters: [
      //                 LengthLimitingTextInputFormatter(64),
      //                 FilteringTextInputFormatter.deny(RegExp(r'\s')),
      //               ],
      //               enableInteractiveSelection: true,
      //               style: Theme.of(context).textTheme.labelMedium,
      //               cursorColor: AppColors.grey,
      //               cursorHeight: 18,
      //               decoration: InputDecoration(
      //
      //                 filled: true,
      //                 fillColor: AppColors.yellowishWhite,
      //                 border: InputBorder.none,
      //                 hintStyle: Theme.of(context).textTheme.labelMedium,
      //                 contentPadding:
      //                 const EdgeInsets.only(bottom: 3, left: 15),
      //                 hintText: "Upload your visa",
      //                 alignLabelWithHint: true, // Center the hintText
      //               ),
      //             ),
      //           ),
      //           Container(
      //             height: 45,
      //             width: 43,
      //             decoration: BoxDecoration(
      //                 color: AppColors.yellowishWhite,
      //                 borderRadius: BorderRadius.circular(5),
      //               border: Border.all(color: AppColors.lightWhite),
      //             ),
      //             child:   const Icon(Icons.add_circle_outline_outlined,color: AppColors.black,),
      //
      //           ),
      //         ],
      //       ).paddingOnly(bottom: Get.height*0.02),
      //
      //       Text('Passport',
      //         style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
      //       SizedBox(
      //         height: Get.height*0.01,
      //       ),
      //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             height: 45,
      //             width: Get.width*0.78,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: AppColors.lightWhite),
      //               shape: BoxShape.rectangle,
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: TextField(
      //               inputFormatters: [
      //                 LengthLimitingTextInputFormatter(64),
      //                 FilteringTextInputFormatter.deny(RegExp(r'\s')),
      //               ],
      //               enableInteractiveSelection: true,
      //               style: Theme.of(context).textTheme.labelMedium,
      //               cursorColor: AppColors.grey,
      //               cursorHeight: 18,
      //               decoration: InputDecoration(
      //
      //                 filled: true,
      //                 fillColor: AppColors.yellowishWhite,
      //                 border: InputBorder.none,
      //                 hintStyle: Theme.of(context).textTheme.labelMedium,
      //                 contentPadding:
      //                 const EdgeInsets.only(bottom: 3, left: 15),
      //                 hintText: "Upload your passport",
      //                 alignLabelWithHint: true, // Center the hintText
      //               ),
      //             ),
      //           ),
      //           Container(
      //             height: 45,
      //             width: 43,
      //             decoration: BoxDecoration(
      //                 color: AppColors.yellowishWhite,
      //                 borderRadius: BorderRadius.circular(5),
      //               border: Border.all(color: AppColors.lightWhite),
      //             ),
      //             child:   const Icon(Icons.add_circle_outline_outlined,color: AppColors.black,),
      //
      //           ),
      //         ],
      //       ).paddingOnly(bottom: Get.height*0.02),
      //
      //       Text('MSN ID',
      //         style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
      //       SizedBox(
      //         height: Get.height*0.01,
      //       ),
      //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             height: 45,
      //             width: Get.width*0.78,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: AppColors.lightWhite),
      //               shape: BoxShape.rectangle,
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: TextField(
      //               inputFormatters: [
      //                 LengthLimitingTextInputFormatter(64),
      //                 FilteringTextInputFormatter.deny(RegExp(r'\s')),
      //               ],
      //               enableInteractiveSelection: true,
      //               style: Theme.of(context).textTheme.labelMedium,
      //               cursorColor: AppColors.grey,
      //               cursorHeight: 18,
      //               decoration: InputDecoration(
      //
      //                 filled: true,
      //                 fillColor: AppColors.yellowishWhite,
      //                 border: InputBorder.none,
      //                 hintStyle: Theme.of(context).textTheme.labelMedium,
      //                 contentPadding:
      //                 const EdgeInsets.only(bottom: 3, left: 15),
      //                 hintText: "Upload your MSN ID",
      //                 alignLabelWithHint: true, // Center the hintText
      //               ),
      //             ),
      //           ),
      //           Container(
      //             height: 45,
      //             width: 43,
      //             decoration: BoxDecoration(
      //                 color: AppColors.yellowishWhite,
      //                 borderRadius: BorderRadius.circular(5),
      //               border: Border.all(color: AppColors.lightWhite),
      //             ),
      //             child:   const Icon(Icons.add_circle_outline_outlined,color: AppColors.black,),
      //
      //           ),
      //         ],
      //       ).paddingOnly(bottom: Get.height*0.02),
      //       Text('Upload Personal training certification',
      //         style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
      //       SizedBox(
      //         height: Get.height*0.01,
      //       ),
      //       Container(
      //         height: 45,
      //         width: Get.width,
      //         decoration: BoxDecoration(
      //           color: AppColors.yellowishWhite,
      //           border: Border.all(color: AppColors.lightWhite),
      //           shape: BoxShape.rectangle,
      //           borderRadius: BorderRadius.circular(5),
      //         ),
      //         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text('Select document',style: Theme.of(context).textTheme.labelMedium,),
      //             Image.asset(ImagesPaths.upload,scale: 4,)
      //           ],
      //         ).paddingOnly(left: Get.width*0.031,right: Get.width*0.031),
      //       ).paddingOnly(bottom: Get.height*0.08),
      //       Center(
      //         child: InkButton(
      //             child: Text('Continue',
      //               style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.black),),
      //             onTap: (){}),
      //       )
      //
      //     ],
      //   ).paddingOnly(left: Get.width*0.03,right: Get.width*0.03,top: Get.height*0.02),
      // ),
    );
  }
}
