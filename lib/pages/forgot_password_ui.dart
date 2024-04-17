import 'package:flutter/material.dart';

import '../utils/exports.dart';

class ForgotPasswordUI extends StatelessWidget {
  const ForgotPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    CountryCodeController controller = Get.put(CountryCodeController());
    return Scaffold(
      appBar: myAppBar(
          title: Text('Forgot Password',style: Theme.of(context).textTheme.bodyMedium,),
          context: context,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.04,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.blackShade,
                  radius: 90,
                  child: Image.asset(ImagesPaths.lock,scale: 4,),
                ),
              ),
              SizedBox(
                height: Get.height*0.05,
              ),
              Center(child: Text(
                'Please Enter Your Phone Number to\nReceive a Verification Code.',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
              SizedBox(
                height: Get.height*0.07,
              ),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(

                decoration: BoxDecoration(
                    color: AppColors.yellowishWhite,
                    borderRadius: BorderRadius.circular(5)),

                height: 50,
                width: Get.width,
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        width: 112,
                        child: CountryCodePicker(
                            searchDecoration: const InputDecoration(

                                hintText: "search your country code",
                                hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.white),
                                filled: true,fillColor:  Colors.black54),
                            dialogSize: Size(Get.width, Get.height),
                            boxDecoration: const BoxDecoration(),
                            barrierColor: AppColors.blackShade,
                            searchStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),
                            dialogTextStyle: const TextStyle(color: Colors.white),
                            dialogBackgroundColor: Colors.black54,
                            showFlagDialog: true,
                            showDropDownButton: false,
                            textStyle: const TextStyle(color: AppColors.black,fontWeight: FontWeight.w400),
                            initialSelection: controller.countryCode,
                            onChanged: (CountryCode v) {
                              controller.countryCode = v.dialCode!;
                            }



                        )),
                    Transform.translate(offset: const Offset(-26,0),
                        child: const Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.greyButton,)),
                    Transform.translate(
                      offset: const Offset(-20, 0),
                      child: SizedBox(
                        height: 50,
                        width: Get.width * 0.52,
                        child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(64),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            maxLength: 10,
                            controller: controller.phoneNumber,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: AppColors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: Get.height*.004),
                                counterText: "",
                                hintText: 'Enter Phone Number',
                                hintStyle:
                                Theme.of(context).textTheme.labelMedium,
                                border: InputBorder.none,
                                fillColor: AppColors.yellowishWhite)),


                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.2,
              ),
              Center(
                  child: InkButton(
                      child: Text('Sent',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                      onTap: (){
                       Get.toNamed(AppRoutes.verifyPhoneNumber);
                      }))
            ],
          ).paddingOnly(left: Get.width*0.035,right: Get.width*0.035),
        ),
      ),
    );
  }
}//
