import 'package:endoorphin_trainer/controllers/upload_images_controller.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';
class UploadImagesUi extends StatelessWidget {
  const UploadImagesUi({super.key});
  @override
  Widget build(BuildContext context) {
    UploadImagesController controller = Get.put(UploadImagesController());
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.black,
        elevation: 3,
        titleSpacing: -10,
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,

        leading: GestureDetector(
          onTap: () {
            if (controller.selectedoption.value == 3) {
              controller.selectedoption.value = 2;
            } else if (controller.selectedoption.value ==
                2) {
              controller.selectedoption.value = 1;
            } else if(controller.selectedoption.value ==1) {
              controller.selectedoption.value = 0;
            }else{
              Get.back();
            }
          }
        ,child: const SizedBox(
            height: 2,width: 2,
            child: Icon(Icons.arrow_back_ios,size: 18,color: Colors.white,)),
        ),
        title: Text(
          controller.certificationDetails!["categoryName"] == "emirates"? "Emirates ID":controller.certificationDetails!["categoryName"] == "passport"?'Passport':"Certification".toString(),style: Theme.of(context).textTheme.headlineSmall,),

      ),
      body: Obx(
        ()=> Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
              )
          ),
          child:
          controller.selectedoption.value ==0?
          Center(
            child: Column(
              children: [
                SizedBox(height: Get.height*0.03,),
                GestureDetector(
                  onTap: (){
                    if (controller.fontImagePicked.value != null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    controller.fontImagePicked.value!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: AppColors.yellow,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    height: Get.height*0.21,
                    width: Get.width*0.76,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.yellow)
                    ),
                    child:
                    controller.fontImagePicked.value ==null?
                        const SizedBox.shrink():
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(controller.fontImagePicked.value!,fit: BoxFit.cover,))
                  ),
                ),
                SizedBox(height:Get.height*0.2),
                Text('Check Quality',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20),).paddingOnly(bottom: Get.height*0.02),
                Text('Successfully captured the front side of ID..',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.024),
                inkButton(child: Text('Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                    fontFamily: 'Montserrat'),), onTap: (){
                  controller.selectedoption.value=1;
                }).paddingOnly(bottom: Get.height*0.024),
                GestureDetector(
                    onTap: (){
                      controller.removeImage(context,true);
                      controller.selectSource(true);
                    },
                    child: Column(
                      children: [
                        Text('Take a new Photo',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.yellow),),
                        Container(
                          height: 1,
                            width: Get.width*0.3,
                          color: AppColors.yellow,
                        )
                      ],
                    ))
              ],
            ),
          ):
          controller.selectedoption.value ==1?
              Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0.37,),
                    Image.asset(ImagesPaths.restart,height: 35,width: 35,).paddingOnly(bottom: Get.height*0.02),
                    Text('Flip your card',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700,color: Colors.white),).paddingOnly(bottom: Get.height*0.02),
                    Text('Capture the backside of your ID to continue.',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.015).paddingOnly(bottom: Get.height*0.1),
                    inkButton(child: Text('Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                        fontFamily: 'Montserrat'),), onTap: (){
                      controller.selectedoption.value=2;
                      controller.selectSource(false);

                    }).paddingOnly(bottom: Get.height*0.015),
                  ],
                ),
              ):
              controller.selectedoption.value ==2?
              Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0.03,),
                    GestureDetector(
                      onTap: (){
                        if (controller.backImagePicked.value != null) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.backImagePicked.value!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColors.yellow,
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                          height: Get.height*0.21,
                          width: Get.width*0.76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.yellow)
                        ),
                          child:
                          controller.fontImagePicked.value ==null?
                          const SizedBox.shrink():
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(controller.backImagePicked.value ?? controller.defaultImage, fit: BoxFit.cover,)
                      ),),
                    ),
                    SizedBox(height:Get.height*0.2),
                    Text('Check Quality',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20),).paddingOnly(bottom: Get.height*0.02),
                    Text('Successfully captured the back side of ID.',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.024),
                    inkButton(child: Text('Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                        fontFamily: 'Montserrat'),), onTap: (){
                      controller.selectedoption.value=3;
                    }).paddingOnly(bottom: Get.height*0.024),
                    GestureDetector(
                      onTap: (){
                     controller.removeImage(context, false);
                     controller.selectSource(false);
                      },
                        child: Column(
                          children: [
                            Text('Take a new Photo',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.yellow),),
                            Container(
                              height: 1,
                              width: Get.width*0.3,
                              color: AppColors.yellow,
                            )
                          ],
                        ))
                  ],
                ),
              ):
              controller.selectedoption.value ==3?
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height*0.03,),
                      Text('Front',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400),),
                      GestureDetector(
                        onTap: (){
                          if (controller.fontImagePicked.value != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          controller.fontImagePicked.value!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: AppColors.yellow,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 196,
                          width: 329,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.yellow)
                          ),
                          child: controller.fontImagePicked.value ==null?
                          const SizedBox.shrink():
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(controller.fontImagePicked.value!,fit: BoxFit.cover,)),
                        ),
                      ),
                      SizedBox(height: Get.height*0.03,),
                      Text('Back',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400),),
                      GestureDetector(
                        onTap: (){
                          if (controller.backImagePicked.value != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          controller.backImagePicked.value!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: AppColors.yellow,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 196,
                          width: 329,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.yellow)
                          ),
                          child: controller.backImagePicked.value ==null?
                          const SizedBox.shrink():
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(controller.backImagePicked.value!,fit: BoxFit.cover,)),
                        ).paddingOnly(bottom: Get.height*0.07),
                      ),
                      Center(
                        child: inkButton(child: Text('Save',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                            fontFamily: 'Montserrat'),),
                            onTap: (){
                          controller.onSaveButton();
                        }).paddingOnly(bottom: Get.height*0.02),
                      ),
                      Center(
                        child: inkButton(
                            backGroundColor: Colors.transparent,
                            child: Text('Try Again',style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.yellow,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                            onTap: (){
                              controller.selectedoption.value=0;
                              controller.removeImage(context,true);
                              controller.removeImage(context,false);
                              controller.selectSource(true);

                        }).paddingOnly(bottom: Get.height*0.015),
                      ),
                    ],
                  ).paddingOnly(left: 50,right: 50)

        :const SizedBox.shrink())
      ),
    );
  }
}
