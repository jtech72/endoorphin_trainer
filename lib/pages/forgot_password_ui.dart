import 'package:flutter/material.dart';
import '../utils/exports.dart';
class ForgotPasswordUI extends StatelessWidget {
  const ForgotPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
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
                Get.offAllNamed(AppRoutes.login);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.white,
                size: 18,
              )),
          title:GestureDetector(
              onTap: (){
                Get.offAllNamed(AppRoutes.login);
              },
              child: Text('Forgot Password',style: Theme.of(context).textTheme.headlineSmall,)),
        ),
        // appBar: myAppBar(
        //   title: GestureDetector(onTap: (){Get.back();},child: Text('Forgot Password',style: Theme.of(context).textTheme.headlineSmall,)),
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
                        image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.greyButton,
                      radius: 90,
                      child: Image.asset(ImagesPaths.lock,scale: 4,),
                    ).paddingOnly(top: Get.height*0.04),
                  ),
                  Center(
                      child:
                      Text(
                    'Please Enter Your Email id to Receive\n a Password reset url.',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,
                      ).paddingOnly(top: Get.height*0.05),
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.labelLarge,
                  ).paddingOnly(top: Get.height*0.07),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.yellowishWhite,
                        borderRadius: BorderRadius.circular(5)),

                    height: 50,
                    width: Get.width,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: Get.width *.9,
                          child: TextField(


                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              controller: controller.emailController,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.black),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 2,bottom: 7),
                                  counterText: "",
                                  hintText: 'Enter your Email',
                                  hintStyle:
                                  Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lightGrey),
                                  border: InputBorder.none,
                                  fillColor: AppColors.yellowishWhite)).paddingOnly(left: 20),
                        ),
                      ],
                    ),
                  ).paddingOnly(top: Get.height*0.01),
                  Center(
                      child: inkButton(
                          child: Text('Send',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                          onTap: () {
                              controller.onSubmitButton(context);

                          }).paddingOnly(top: Get.height*0.2),
                  ),
                ],
              ).paddingOnly(left: Get.width*0.035,right: Get.width*0.035),
            ),
          ],
        ),
      ),
    );
  }
}//
