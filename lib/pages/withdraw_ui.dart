import 'package:endoorphin_trainer/controllers/withdraw_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class WithdrawUI extends StatelessWidget {
  const WithdrawUI({super.key});

  @override
  Widget build(BuildContext context) {
    WithdrawController controller = Get.put(WithdrawController());
    return Scaffold(
     appBar: myAppBar(
         title: Text('Withdraw',
           style: Theme.of(context).textTheme.headlineSmall,),
         context: context
     ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 71,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.greyButton,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Balance',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
                  Text('AED2648.00',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500,color: AppColors.yellow),),
                ],
              ).paddingOnly(right: Get.width*0.05,left: Get.width*0.05),
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            Text('Amount',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),),
            SizedBox(
              height: Get.height*0.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: Get.width*0.82,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.impgrey),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
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
                            hintText: "Enter Amount",
                            alignLabelWithHint: true, // Center the hintText
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                          child: Container(
                            color: AppColors.yellowishWhite,
                            child: const Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.keyboard_arrow_up_outlined,color: AppColors.black,size:18,),
                                Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.black,size:18,)
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 43,
                  decoration: BoxDecoration(
                    color: AppColors.yellowishWhite,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:   Center(
                    child: Text('AED',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.black),),
                  ),
        
                ),
              ],
            ),
            SizedBox(
              height: Get.height*0.03,
            ),
            Text('Withdraw to',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),).paddingOnly(bottom: Get.height*0.02),
        
            GetBuilder<WithdrawController>(
              builder: (controller) => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 40,
                ),
                itemCount: controller.items2.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => controller.selectItem2(index), // Call selectItem2 method
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        mode(
                          image: Image.asset(
                            controller.items2[index].imagePath.toString(),
        
                            scale: 3.8,
                          ),
                          isSelected: index == controller.selectedMembership,
                          name: Text(
                            controller.cardname[index],
                            style: const TextStyle(
                                color: AppColors.lightGrey1,
                                fontWeight: FontWeight.w400,fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        
            ),
            Transform.translate(
              offset: const Offset(0,-20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card holder name',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),).paddingOnly(bottom: Get.height*0.01),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
        
                        hintText: "Enter Name",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ).paddingOnly(bottom: Get.height*0.02),
                  Text('Card number',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),).paddingOnly(bottom: Get.height*0.01),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
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
        
                        hintText: "Enter Number ",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ).paddingOnly(bottom: Get.height*0.1),
                  Center(child: InkButton(child: Text('Withdraw',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),), onTap: (){})),
                ],
              ),
            )
          ],
        ).paddingOnly(left: Get.width*0.03,right: Get.width*0.03,top: Get.height*0.02),
      ),
    );
  }
}

Widget mode({
  required Image image,
  required Text name,
  bool isSelected = false,
  Color normalColor = AppColors.greyButton,
  Color selectedColor = AppColors.yellow,
}) {
  return Container(

    alignment: Alignment.center,
    height: Get.height*0.1,
    width: Get.width*0.27,
    decoration: BoxDecoration(
      color: AppColors.greyButton,
      border: Border.all(color: isSelected ? AppColors.yellow : normalColor),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        image,
        name
      ],
    ).paddingOnly(left: 0, right: 20, top: 10 ),
  ).paddingZero;
}

