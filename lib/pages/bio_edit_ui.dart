import 'package:endoorphin_trainer/controllers/bio_edit_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../services/network_services/api_call.dart';

class BioEditUi extends StatelessWidget {
  const BioEditUi({super.key});

  @override
  Widget build(BuildContext context) {
    BioEditController controller = Get.put(BioEditController());
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ImagesPaths.bgBlackShade,
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: CallAPI.getProfileDetails(storage.read("userId").toString()),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ).paddingOnly(top: 20);
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.result == null) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
                controller.niceNameController.text =
                    snapshot.data?.result?.nickName?.toString() ?? "";
                controller.motivationController.text =
                    snapshot.data?.result?.quote?.toString() ?? "";
                controller.areaOfExpertiseController.text =
                    snapshot.data?.result?.areaExpertise?.toString() ?? "";
                controller.experienceController.text =
                    snapshot.data?.result?.yearExperience?.toString() ?? "";
                controller.funFactController.text =
                    snapshot.data?.result?.funFact?.toString() ?? "";
                controller.bioController.text =
                    snapshot.data?.result?.bio?.toString() ?? "";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Nick Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                        Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.niceNameController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))                      ],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6, left: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Enter Nick Name',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text("Areas of Expertise",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                        Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.areaOfExpertiseController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          NoLeadingSpaceFormatter(),
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))                      ],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6, left: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: ' Enter Professional Title',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text("Years of Experience",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                        Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.experienceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [NoLeadingSpaceFormatter()],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6, left: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: ' Enter Years of Experience',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'Fun Fact/Profesional Anecdote',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.funFactController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [NoLeadingSpaceFormatter()],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6, left: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Enter Fun Fact/Profesional Anecdote',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'Motivational Quote',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.motivationController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [NoLeadingSpaceFormatter()],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6, left: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Enter Motivational Quote',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                      height: Get.height * 0.01,
                    ),
                    Text(
                      'Mention Bio',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: Get.height * 0.011,
                    ),
                    Container(
                      height: Get.height * 0.16,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.bioController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [NoLeadingSpaceFormatter()],
                        maxLines: 10,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),

                          fillColor: Colors.transparent,
                          hintText: 'Tell us something about yourself',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.white),
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
                                    .copyWith(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat'),
                              ),
                              onTap: () {
                                controller.onUpdateButton();

                              })
                          .paddingOnly(top: 50),
                    ),
                  ],
                ).paddingOnly(left: 18, right: 18);
              },
            ),
          ),
        ),
      ),
    );
  }
}
