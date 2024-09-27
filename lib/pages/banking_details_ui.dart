import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class BankingDetailsUI extends StatelessWidget {
  const BankingDetailsUI({super.key});

  @override
  Widget build(BuildContext context) {
    BankingDetailsController controller = Get.put(BankingDetailsController());
    GlobalKey popupKey = GlobalKey();
    return Scaffold(
      appBar: myAppBar(
          title: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Banking Details',
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          context: context),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImagesPaths.bgBlackShade,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          SingleChildScrollView(
              child: FutureBuilder(
                  future: CallAPI.getBankDetail(
                      id: storage.read("userId").toString()),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text(""),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    controller.ifscController.text =
                        snapshot.data?.result?.ifscCode?.toString() ?? "";
                    controller.bankNameController.text =
                        snapshot.data?.result?.bankName?.toString() ?? "";
                    controller.cityController.text =
                        snapshot.data?.result?.city?.toString() ?? "";
                    controller.branchController.text =
                        snapshot.data?.result?.branchName?.toString() ?? "";
                    controller.accountNameController.text =
                        snapshot.data?.result?.accountName?.toString() ?? "";
                    controller.bankAcNumberController.text =
                        snapshot.data?.result?.banckAccountNumber?.toString() ??
                            "";
                    controller.confirmBankAcNumberController.text =
                        snapshot.data?.result?.banckAccountNumber?.toString() ??
                            "";
                    controller.accountTypeController.text =
                        snapshot.data?.result?.accountType?.toString() ?? "";
                    controller.effectiveController.text =
                        snapshot.data?.result?.effectiveData?.toString() ?? "";
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Text(
                          'Bank Information',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).paddingOnly(bottom: Get.height * 0.01),
                        Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: AppColors.greyButton,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  controller: controller.ifscController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z0-9\s]')),
                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "IFSC CODE",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller: controller.bankNameController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "BANK NAME",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller: controller.cityController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    NoLeadingSpaceFormatter(),
                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "CITY",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller: controller.branchController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "BRANCH NAME",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                            ]).paddingOnly(
                                left: Get.width * 0.04,
                                right: Get.width * 0.04,
                                top: Get.height * 0.01,
                                bottom: Get.height * 0.035)),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Text(
                          'Account Information',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).paddingOnly(bottom: Get.height * 0.01),
                        Container(
                            // height: Get.height*0.26,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: AppColors.greyButton,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller: controller.accountNameController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    NoLeadingSpaceFormatter(),


                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText:
                                          "ACCOUNT NAME(AS PER BANK DETAILS)",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller: controller.bankAcNumberController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(14),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],

                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "BANK A/C NUMBER",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: TextField(
                                  controller:
                                      controller.confirmBankAcNumberController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(14),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  enableInteractiveSelection: true,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  cursorColor: AppColors.grey,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.blackShade,
                                      border: const OutlineInputBorder(),
                                      hintStyle:
                                          Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 0, left: 0),
                                      hintText: "CONFIRM BANK A/C NUMBER",
                                      alignLabelWithHint: true,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                height: 1,

                                width: Get.width,
                                color: AppColors.darkGrey,
                              ).paddingOnly(bottom: 2),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context).unfocus();
                                                  controller.showBottomSheet.value = !controller.showBottomSheet.value;
                                                },
                                                child: SizedBox(
                                                  width: Get.width * 0.25,
                                                  child: Obx(
                                                        () => TextField(
                                                      controller: controller.accountTypeController,
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
                                                        border: const OutlineInputBorder(),
                                                        hintStyle: Theme.of(context).textTheme.labelMedium,
                                                        contentPadding: const EdgeInsets.only(bottom: 0, left: 0),
                                                        hintText: controller.selectedOption1.value,
                                                        alignLabelWithHint: true,
                                                        enabledBorder: InputBorder.none,
                                                        disabledBorder: InputBorder.none,
                                                        focusedBorder: InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                ////
                                                icon: const Icon(Icons.keyboard_arrow_down, size: 30, color: AppColors.lightGrey),
                                                onPressed: () {
                                                  FocusScope.of(context).unfocus();
                                                  controller.showBottomSheet.value = !controller.showBottomSheet.value;
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )   ,
                                        Container(
                                          height: 1,

                                          width: Get.width,
                                          color: AppColors.darkGrey,
                                        ).paddingOnly(bottom: 0),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller:
                                              controller.effectiveController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(64),
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'\s')),
                                          ],
                                          enableInteractiveSelection: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          cursorColor: AppColors.grey,
                                          cursorHeight: 18,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: AppColors.blackShade,
                                              border: const OutlineInputBorder(),
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!.copyWith(fontSize: 14),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      bottom: 0, left: 0),
                                              hintText: "EFFECTIVE DATA",
                                              alignLabelWithHint: true,
                                              enabledBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none),
                                        ),
                                        Container(
                                          height: 1,

                                          width: Get.width,
                                          color: AppColors.darkGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ]).paddingOnly(
                                left: Get.width * 0.04,
                                right: Get.width * 0.04,
                                top: Get.height * 0.01,
                                bottom: Get.height * 0.035)),
                        SizedBox(
                          height: Get.height * .06,
                        ),
                        Center(
                          child: inkButton(
                            child: Obx(() {
                              String buttonTextValue = controller.buttonText.value == 0 ? 'Save' : 'Update';
                              return Text(
                                buttonTextValue,
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                ),
                              );
                            }),
                            onTap: () {
                              controller.onSaveButton();
                            },
                          ),
                        )


                      ],
                    ).paddingOnly(
                        left: Get.width * 0.05, right: Get.width * 0.05);
                  }),
            ),
          Positioned(
            top: Get.height*.62,
            left: Get.width*.09,
            child: Obx(
                  () => Visibility(
                visible: controller.showBottomSheet.value,
                child: SizedBox(
                  width: Get.width*.4,
                  child: BottomSheet(
                    onClosing: () {
                      controller.showBottomSheet.value = false;
                    },
                    builder: (context) => Container(
                      color: AppColors.blackShade,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: controller.items2.map((String value) {
                          return ListTile(
                            title: Text(value, style: const TextStyle(color: AppColors.lightGrey)),
                            onTap: () {
                              controller.selectedOption1.value = value;
                              controller.showBottomSheet.value = false;
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
