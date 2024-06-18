import 'package:endoorphin_trainer/controllers/document_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../services/network_services/api_call.dart';

class DocumentUI extends StatelessWidget {
  const DocumentUI({super.key});

  @override
  Widget build(BuildContext context) {
    DocumentController controller = Get.put(DocumentController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(
          title: GestureDetector(
            onTap: (){Get.back();},
            child: Text('Documents',
              style: Theme.of(context).textTheme.headlineSmall,),
          ),
          context: context
      ),

      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                  offset: Offset(10,0),
                  child: Text('Uploaded Documents',style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(bottom: Get.height*0.03,top: Get.height*0.01,left: 10)),
              FutureBuilder(
                future:
                CallAPI.getDocStatus(storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: Get.height*.7,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ).paddingOnly(top: 20),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.result == null) {
                    return SizedBox(
                      height: Get.height*.7,
                      child: const Center(
                        child: Text('No data available',style: TextStyle(color: AppColors.white),),
                      ),
                    );
                  }
                  return   SizedBox(
                    height: Get.height-150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.result!.length,
                        itemBuilder: (context,index){
                          return
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.greyButton,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                          snapshot.data!.result![index].category == null?
                          snapshot.data!.result![index].emirates == null?
                          snapshot.data!.result![index].passport.toString().toUpperCase():
                              snapshot.data!.result![index].emirates.toString().toUpperCase():
                                    snapshot.data!.result![index].category!.name.toString(),style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.yellow),),
                                  Row(
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 52,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color:
                                            snapshot.data!.result![index].approveStatus =="pending"?
                                            AppColors.backgroundcolor2:AppColors.black
                                        ),
                                        child: Center(child: Text('SAVED',style: TextStyle(fontSize: 10,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Colors.white))),
                                      ).paddingOnly(right: Get.width*0.03),
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
                                  Flexible(
                                    child: Container(
                                      height: 131,
                                      width: 204,
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                          snapshot.data!.result![index].documentFrontImg == null?
                                          snapshot.data!.result![index].passportfrontImg == null?
                                          snapshot.data!.result![index].emiratesfrontImg.toString():
                                          snapshot.data!.result![index].passportfrontImg.toString():
                                          snapshot.data!.result![index].documentFrontImg.toString()),
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Institute  Name',style: Theme.of(context).textTheme.labelMedium,).paddingOnly(bottom: 2),
                                      Text(
                                          snapshot.data!.result![index].category == null?
                                              snapshot.data!.result![index].emirates == null?
                                              snapshot.data!.result![index].passportName.toString().toUpperCase():
                                              snapshot.data!.result![index].emiratesName.toString().toUpperCase():
                                            snapshot.data!.result![index].category!.name.toString()
                                      ,style: Theme.of(context).textTheme.labelSmall,).paddingOnly(bottom: 8),
                                      Text('Certification Year',style: Theme.of(context).textTheme.labelMedium,).paddingOnly(bottom: 2),
                                      Text('john abc',style: Theme.of(context).textTheme.labelSmall,),
                                      SizedBox(
                                        height: Get.height*0.02,
                                      ),
                                      snapshot.data!.result![index].approveStatus == "approved"?
                                           Container(
                                             height: 22,
                                             width: 64,
                                             decoration:BoxDecoration(
                                               color: AppColors.yellow,
                                               borderRadius: BorderRadius.circular(5)
                                             ) ,
                                             child: Center(child: Text('Approved',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.black))),
                                           ):
                                      snapshot.data!.result![index].approveStatus == "pending"?

                                      Container(
                                        height: 22,
                                        width: 100,
                                        decoration:BoxDecoration(
                                            color: AppColors.backgroundcolor2,
                                            borderRadius: BorderRadius.circular(5)
                                        ) ,
                                        child: Center(child: Text('Under verification',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.whiteShade))),
                                      ):
                                      GestureDetector(
                                        onTap: (){
                                          uploadImage = UploadImage.byProfile;
                                          Get.toNamed(AppRoutes.uploadimage,arguments: {
                                            "userId":snapshot.data!.result![index].userId.toString() ,
                                            "categoryName":"" ,
                                            "categoryId":snapshot.data!.result![index].category!.id.toString() ,
                                            "certificateNumber": "",
                                            "certificateName": "",
                                          });
                                          },
                                        child: Container(
                                          height: 22,
                                          width: 120,
                                          decoration:BoxDecoration(
                                              color: AppColors.yellow,
                                              borderRadius: BorderRadius.circular(5)
                                          ) ,
                                          child: Center(child: Text('Reupload Documents',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.black))),
                                        ),
                                      )
                                    ],
                                  ).paddingOnly(left: Get.width*0.04)
                                ],
                              ),
                              snapshot.data!.result![index].remark == null?
                              Text(""):
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Rejection Reason",style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.white),),
                                      Text(snapshot.data!.result![index].remark!.toString(),style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10,color: AppColors.whiteShade),),
                                    ],
                                  ).paddingOnly(top: 5)
                            ],
                          ).paddingOnly(bottom: 5,top: 15,right: 15,left: 15),
                        ),
                      );

                    }),
                  )  ;

                },
              ),

            ],
          ),
        ),
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
