import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_Widgets/common_widgets.dart';

class BioEditUi extends StatelessWidget {
  const BioEditUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(
        title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Bio',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        context: context,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nick Name',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Enter Nick Name',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Professional Title',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: ' Enter Professional Title',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Years of Experience',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: ' Enter Years of Experience',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Fun Fact/Profesional Anecdote',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Enter Fun Fact/Profesional Anecdote',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Motivational Quote',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Enter Motivational Quote',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Mention Bio',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: Get.height*0.16,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey3),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(

                keyboardType: TextInputType.text,

                maxLines:10,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),

                  fillColor: Colors.transparent,
                  hintText: 'Tell us something about yourself',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  disabledBorder: InputBorder.none,
                  // suffixIcon: const Icon(Icons.keyboard_arrow_down,color: AppColors.lightGrey1).paddingOnly(left: 20,right: 20),
                ),
              ),
            ),
            Center(
              child: InkButton(
                  child: Text(
                    'Update',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.black,fontSize: 18,
                        fontFamily: 'Montserrat'),
                  ),
                  onTap: () {

                  }).paddingOnly(top: 50),
            ),
          ],
        ).paddingOnly(left: 18,right: 18),
      ),
    );
  }
}
