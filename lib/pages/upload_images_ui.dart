import 'package:endoorphin_trainer/controllers/more_about_you_controller.dart';
import 'package:endoorphin_trainer/controllers/upload_images_controller.dart';
import 'package:flutter/material.dart';
import '../controllers/trainer_passport_controller.dart';
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
        ,child: Container(
            height: 2,width: 2,
            child: Icon(Icons.arrow_back_ios,size: 18,color: Colors.white,)),
        ),
        title: Text(controller.documentIndex == 0? "Emirates ID":controller.documentIndex == 1?'Passport':"Certification",style: Theme.of(context).textTheme.headlineSmall,),

      ),
      body: Obx(
        ()=> Container(
          decoration: BoxDecoration(
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
                Text('Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.024),
                InkButton(child: Text('Looks great! Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                    fontFamily: 'Montserrat'),), onTap: (){
                  controller.selectedoption.value=1;
                }).paddingOnly(bottom: Get.height*0.024),
                GestureDetector(
                    onTap: (){
                      controller.removeImage(true);
                    },
                    child: Text('Take a new Photo',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.yellow),))
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
                    Text('Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.015).paddingOnly(bottom: Get.height*0.1),
                    InkButton(child: Text('Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                        fontFamily: 'Montserrat'),), onTap: (){
                      controller.selectedoption.value=2;
                      controller.openCamera(false);

                    }).paddingOnly(bottom: Get.height*0.015),
                  ],
                ),
              ):
              controller.selectedoption.value ==2?
              Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0.03,),
                    Container(
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
                    SizedBox(height:Get.height*0.2),
                    Text('Check Quality',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20),).paddingOnly(bottom: Get.height*0.02),
                    Text('Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,).paddingOnly(bottom: Get.height*0.024),
                    InkButton(child: Text('Looks great! Continue',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                        fontFamily: 'Montserrat'),), onTap: (){
                      controller.selectedoption.value=3;
                    }).paddingOnly(bottom: Get.height*0.024),
                    GestureDetector(
                      onTap: (){
                        controller.openCamera(false);

                      },
                        child: Text('Take a new Photo',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.yellow),))
                  ],
                ),
              ):
              controller.selectedoption.value ==3?
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height*0.03,),
                      Text('Front',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400),),
                      Container(
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
                      SizedBox(height: Get.height*0.03,),
                      Text('Back',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400),),
                      Container(
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
                      Center(
                        child: InkButton(child: Text('Save',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18,
                            fontFamily: 'Montserrat'),),
                            onTap: (){
                         Get.toNamed(AppRoutes.moreaboutyou,arguments: [""]);
                        }).paddingOnly(bottom: Get.height*0.02),
                      ),
                      Center(
                        child: InkButton(
                            backGroundColor: Colors.transparent,
                            child: Text('Try Again',style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.yellow,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                            onTap: (){
                              controller.selectedoption.value=0;
                              controller.removeImage(true);
                              controller.removeImage(false);
                              controller.openCamera(true);

                        }).paddingOnly(bottom: Get.height*0.015),
                      ),
                    ],
                  ).paddingOnly(left: 50,right: 50)

        :SizedBox.shrink())
      ),
    );
  }
}
