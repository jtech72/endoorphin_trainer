import 'package:flutter/material.dart';
import '../utils/exports.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello There",style: Theme.of(context).textTheme.headlineMedium,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username/Phone Number",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(64),
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  enableInteractiveSelection: true,
                  style: Theme.of(context).textTheme.labelMedium,
                  cursorColor: AppColors.grey,
                  cursorHeight: 18,
                  decoration: InputDecoration(

                    filled: true,
                    fillColor: AppColors.yellowishWhite,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    contentPadding:
                    const EdgeInsets.only(bottom: 3, left: 15),

                    hintText: "Enter username/phone number",
                    alignLabelWithHint: true, // Center the hintText
                  ),
                ),
              ),
              Text("Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(64),
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  enableInteractiveSelection: true,
                  style: Theme.of(context).textTheme.labelMedium,
                  cursorColor: AppColors.grey,
                  cursorHeight: 18,
                  decoration: InputDecoration(

                    filled: true,
                    fillColor: AppColors.yellowishWhite,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    contentPadding:
                    const EdgeInsets.only(bottom: 3, left: 15),

                    hintText: "Enter password ",
                    alignLabelWithHint: true, // Center the hintText
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password ?",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),).paddingOnly(top: 8,bottom: 8),
                ],
              ),

            ],
          ).paddingOnly(top: 40,bottom: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkButton(child: Text("Login",  style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.black),), onTap: (){}),
            ],
          )
        ],
      ).paddingOnly(left: 18,right: 18),
    );
  }
}