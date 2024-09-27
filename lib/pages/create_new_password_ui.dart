import 'package:flutter/material.dart';
import '../utils/exports.dart';
class CreateNewPasswordUI extends StatelessWidget {
   const CreateNewPasswordUI({super.key});
  @override
  Widget build(BuildContext context) {
    CreateNewPasswordController controller = Get.put(CreateNewPasswordController());
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leadingWidth: Get.width * 0.17,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.black,
          elevation: 3,
          titleSpacing: -10,
          leading: GestureDetector(
              onTap: () {
                Get.offAllNamed(AppRoutes.forgotPassword);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.white,
                size: 18,
              )),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPassword);
                },
                child: Text('Create New Password',style: Theme.of(context).textTheme.headlineSmall,),
              ),
            ],
          ),
        ),
        // appBar: myAppBar(
        //   title: GestureDetector(onTap: (){Get.back();},child: Text('Create New Password',style: Theme.of(context).textTheme.headlineSmall,)),
        //   context: context,),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPaths.bgBlackShade),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height*0.04,
                  ),
                  Center(
                      child: CircleAvatar(
                        backgroundColor: AppColors.greyButton,
                        radius: 90,
                        child: Stack(
                          children: [
                            Image.asset(ImagesPaths.newLock,scale: 4,),
                            Positioned(
                                bottom: 12,
                                right: 10,
                                child: Image.asset(ImagesPaths.tick,scale: 4,)),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    height: Get.height*0.05,
                  ),
                  Center(child: Text(
                    'Your new Password Must be Different\nfrom Previously Used Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                  SizedBox(
                    height: Get.height*0.07,
                  ),
                  Text('New Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white,fontSize: 14),textAlign: TextAlign.start,),

                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Obx(
                          () => TextField(
                        onChanged: (v) {
                          controller.isValidVisible.value = !controller.isPasswordValid(v);
                        },
                        controller: controller.newPasswordController,
                        obscureText: controller.obscureText.value,
                        obscuringCharacter: "*",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        enableInteractiveSelection: true,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.black),
                        cursorColor: Colors.grey,
                        cursorHeight: 18,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              controller.obscureText.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                            onPressed: () {
                              controller.toggleObscureText();
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.grey),
                          contentPadding: const EdgeInsets.only(top: 10, left: 25),
                          hintText: "Enter New password",
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                        () => Visibility(
                      visible: controller.isValidVisible.value,
                      child: Text(
                        "Your password must contain at least one uppercase letter, one number, and one special character",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.red),
                      ).paddingOnly(top: 5),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text('Confirm Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white,fontSize: 14),textAlign: TextAlign.start,),

                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightWhite),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Obx(
                      ()=> TextField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.obscureText1.value,
                        obscuringCharacter: "*",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],

                        enableInteractiveSelection: true,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.black),
                        cursorColor: AppColors.grey,
                        cursorHeight: 18,

                        decoration: InputDecoration(

                          suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              controller.obscureText1.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                            onPressed: () {
                              controller.toggleObscureText1();
                            },
                          ),

                          filled: true,
                          fillColor: AppColors.yellowishWhite,
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lightGrey),
                          contentPadding:
                          const EdgeInsets.only(top: 10, left: 25),

                          hintText: "Enter Confirm password",
                          alignLabelWithHint: true, // Center the hintText
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height*0.13,
                  ),
                  Center(
                      child: inkButton(
                          child: Text('Submit',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                          onTap: () {
                            controller.onSubmitButton(context);
                          })
                  )
                ],
              ).paddingOnly(left: Get.width*0.055,right: Get.width*0.055),
            ),
          ],
        ),
      ),
    );
  }
}
