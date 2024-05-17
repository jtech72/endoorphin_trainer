import 'package:endoorphin_trainer/controllers/banking_details_controller.dart';
import 'package:endoorphin_trainer/custom_Widgets/common_widgets.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BankingDetailsUI extends StatelessWidget {
  const BankingDetailsUI({super.key});

  @override
  Widget build(BuildContext context) {
    BankingDetailsController controller = Get.put(BankingDetailsController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: myAppBar(title: Text('Banking Details',style: Theme.of(context).textTheme.bodyMedium,), context: context),
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
                    Text('Banking Details',
                      style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ).paddingOnly(left: Get.width*0.04),
                SizedBox(
                  height: Get.height*0.03,
                ),
                Text('Bank Information',style: Theme.of(context).textTheme.bodyMedium,).paddingOnly(bottom: Get.height*0.01),
                Container(
                  height: Get.height*0.29,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.blackShade,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      TextField(
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
                        fillColor: AppColors.blackShade,
                        border: OutlineInputBorder(),
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        contentPadding:
                        const EdgeInsets.only(bottom: 0, left: 0),

                        hintText: "IFSC CODE",
                        alignLabelWithHint: true,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none
                        ),
                      ),
                      Container(
                        height: 2,
                        width: Get.width,
                        color: AppColors.darkGrey,
                      ),
                      TextField(
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
                            fillColor: AppColors.blackShade,
                            border: OutlineInputBorder(),
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            contentPadding:
                            const EdgeInsets.only(bottom: 0, left: 0),

                            hintText: "BANK NAME",
                            alignLabelWithHint: true,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                        ),
                      ),
                      Container(
                        height: 2,
                        width: Get.width,
                        color: AppColors.darkGrey,
                      ),
                      TextField(
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
                            fillColor: AppColors.blackShade,
                            border: OutlineInputBorder(),
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            contentPadding:
                            const EdgeInsets.only(bottom: 0, left: 0),

                            hintText: "CITY",
                            alignLabelWithHint: true,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                        ),
                      ),
                      Container(
                        height: 2,
                        width: Get.width,
                        color: AppColors.darkGrey,
                      ),
                      TextField(
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
                            fillColor: AppColors.blackShade,
                            border: OutlineInputBorder(),
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            contentPadding:
                            const EdgeInsets.only(bottom: 0, left: 0),

                            hintText: "BRANCH NAME",
                            alignLabelWithHint: true,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                        ),
                      ),
                      Container(
                        height: 2,
                        width: Get.width,
                        color: AppColors.darkGrey,
                      ),
                  ]).paddingOnly(left: Get.width*0.04,right: Get.width*0.04,top: Get.height*0.01,bottom: Get.height*0.01)
                  ),
                SizedBox(
                  height: Get.height*0.04,
                ),
                Text('Account Information',style: Theme.of(context).textTheme.bodyMedium,).paddingOnly(bottom: Get.height*0.01),
                Container(
                    height: Get.height*0.29,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: AppColors.blackShade,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                        children: [
                          TextField(
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
                                fillColor: AppColors.blackShade,
                                border: OutlineInputBorder(),
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                const EdgeInsets.only(bottom: 0, left: 0),

                                hintText: "ACCOUNT NAME(AS PER BANK DETAILS)",
                                alignLabelWithHint: true,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                          Container(
                            height: 2,
                            width: Get.width,
                            color: AppColors.darkGrey,
                          ),
                          TextField(
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
                                fillColor: AppColors.blackShade,
                                border: OutlineInputBorder(),
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                const EdgeInsets.only(bottom: 0, left: 0),

                                hintText: "BANK A/C NUMBER",
                                alignLabelWithHint: true,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                          Container(
                            height: 2,
                            width: Get.width,
                            color: AppColors.darkGrey,
                          ),
                          TextField(
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
                                fillColor: AppColors.blackShade,
                                border: OutlineInputBorder(),
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                const EdgeInsets.only(bottom: 0, left: 0),

                                hintText: "CONFIRM BANK A/C NUMBER",
                                alignLabelWithHint: true,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                          Container(
                            height: 2,
                            width: Get.width,
                            color: AppColors.darkGrey,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:5,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: Get.width*0.25,
                                          child: Obx(
                                            ()=> TextField(
                                              enabled: false,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(64),
                                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                              ],
                                              enableInteractiveSelection: true,
                                              style: Theme.of(context).textTheme.labelMedium,
                                              cursorColor: AppColors.lightGrey,
                                              cursorHeight: 18,
                                              decoration: InputDecoration(

                                                  filled: true,
                                                  fillColor: AppColors.blackShade,
                                                  border: OutlineInputBorder(),
                                                  hintStyle: Theme.of(context).textTheme.labelMedium,
                                                  contentPadding:
                                                  const EdgeInsets.only(bottom: 0, left: 0),

                                                  hintText: controller.selectedOption1.value,
                                                  alignLabelWithHint: true,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none
                                              ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuButton<String>(
                                          icon: Icon(Icons.keyboard_arrow_down, size: 30, color: AppColors.lightGrey),
                                          color: AppColors.blackShade, // Set the background color of the dropdown menu
                                          itemBuilder: (BuildContext context) {
                                            return controller.items2.map<PopupMenuEntry<String>>((String value) {
                                              return PopupMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(color: AppColors.lightGrey), // Set the text color of each item
                                                ),
                                              );
                                            }).toList();
                                          },
                                          onSelected: (selectedValue) {
                                            controller.selectedOption1.value = selectedValue;
                                          },
                                        ),
                                       // Icon(Icons.keyboard_arrow_down,color: AppColors.lightGrey,size: 32,)
                                      ],
                                    ),
                                    Container(
                                      height: 2,
                                      width: Get.width,
                                      color: AppColors.darkGrey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    TextField(
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
                                          fillColor: AppColors.blackShade,
                                          border: OutlineInputBorder(),
                                          hintStyle: Theme.of(context).textTheme.labelMedium,
                                          contentPadding:
                                          const EdgeInsets.only(bottom: 0, left: 0),

                                          hintText: "EFFECTIVE DATA",
                                          alignLabelWithHint: true,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: Get.width,
                                      color: AppColors.darkGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]).paddingOnly(left: Get.width*0.04,right: Get.width*0.04,top: Get.height*0.01,bottom: Get.height*0.01)
                ),
                SizedBox(
                  height: Get.height*.06,
                ),
                Center(child: InkButton(child: Text('Save',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.w500),), onTap: (){}))

              ],
            ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05),
          ),
        ],
      ),
    );
  }
}