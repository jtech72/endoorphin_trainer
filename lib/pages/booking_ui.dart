import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:endoorphin_trainer/utils/app_colors.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../custom_widgets/tabbar_widgets.dart';
import '../utils/app_routes.dart';
import '../utils/image_paths.dart';
import '../utils/app_drawer.dart'; // as
final today = DateUtils.dateOnly(DateTime.now());
// suming this file contains myTabBar function

class BookingUi extends StatefulWidget {
  final initialIndex;


   BookingUi({super.key,required this.initialIndex});

  @override
  State<BookingUi> createState() => _BookingUiState();
}

class _BookingUiState extends State<BookingUi> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool showCalendar = false;
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        // Update your date value or perform any action with picked date
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initialIndex ?? 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BookingController controller = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.impgrey),
        title: Obx(
              () =>
              Text(
                controller.isTrainerOnline.value ? 'Online' : 'Offline',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall,
              ),
        ),
        centerTitle: true,
        actions: [
          Obx(
                () =>
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.isTrainerOnline.value =
                    !controller.isTrainerOnline.value;
                  },
                  child: SizedBox(
                    height: 15,
                    width: 43,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white),
                        color: controller.isTrainerOnline.value
                            ? Colors.yellow
                            : Colors.grey.withOpacity(
                            0.5), // Change container color conditionally
                      ),
                      child: Transform.scale(
                        scale: 0.4,
                        child: Switch(
                          activeTrackColor: Colors.black,
                          activeColor: controller.isTrainerOnline.value ? Colors
                              .yellow : Colors.grey.withOpacity(0.5),
                          // Change switch button color conditionally
                          inactiveThumbImage: AssetImage(
                              ImagesPaths.trainerOnline),
                          activeThumbImage: AssetImage(
                              ImagesPaths.trainerOnline),
                          inactiveThumbColor: Colors.transparent,
                          inactiveTrackColor: Colors.black,
                          value: controller.isTrainerOnline.value,
                          onChanged: (v) {
                            controller.isTrainerOnline.value = !controller
                                .isTrainerOnline.value;
                          },
                        ),
                      ),
                    ).paddingOnly(left: 20),
                  ),
                ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.notification);
            },
            icon: Image.asset(ImagesPaths.bell, scale: 4,),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.04),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upcoming Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        _buildCalendarDialogButton()


                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -Get.height*0.06),
                    child: Column(
                      children: [
                        Container(
                          height: 1, width: Get.width, color: AppColors.grey,)
                            .paddingOnly(top: 15,),
                        Container(
                          height: Get.height * .68,
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.bookingdetails,
                                        arguments: "Upcomming");
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.grey,
                                                      borderRadius: BorderRadius
                                                          .circular(100)),

                                                  child: Center(
                                                      child: Image.asset(
                                                        ImagesPaths.yoga,
                                                        scale: 3,))),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Yoga session with Richard",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .displayLarge,),
                                                  Text("21 Dec . 1.39 pm ",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .displayMedium,)
                                                      .paddingOnly(top: 10),
                                                ],).paddingOnly(left: 15)
                                            ],
                                          ),
                                          Image.asset(ImagesPaths.eye, scale: 4,),
                                        ],
                                      ).paddingOnly(top: 15, left: 18, right: 18),
                                      Container(height: 1,
                                        width: Get.width,
                                        color: AppColors.grey,).paddingOnly(
                                        top: 15,),
                                    ],
                                  ),
                                );
                              }),
                        )


                      ],
                    ),
                  ),

                ],).paddingOnly(top: 18),
            ),), // Example tab content
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.02),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ongoing Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        _buildCalendarDialogButton()
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -Get.height*0.04),

                    child: Column(
                      children: [
                        Container(
                          height: 1, width: Get.width, color: AppColors.grey,)
                            .paddingOnly(top: 15,),
                        Container(
                          height: Get.height * .68,
                          child: ListView.builder(itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    AppRoutes.bookingdetails, arguments: "");
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: AppColors.grey,
                                                  borderRadius: BorderRadius
                                                      .circular(100)),

                                              child: Center(child: Image.asset(
                                                ImagesPaths.yoga, scale: 3,))),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text("Yoga session with Richard",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .displayLarge,),
                                              Text(
                                                "21 Dec . 1.39 pm ", style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .displayMedium,).paddingOnly(
                                                  top: 10),
                                            ],).paddingOnly(left: 15)
                                        ],
                                      ),
                                      Image.asset(ImagesPaths.eye, scale: 4,),
                                    ],
                                  ).paddingOnly(top: 15, left: 18, right: 18),
                                  Container(height: 1,
                                    width: Get.width,
                                    color: AppColors.grey,).paddingOnly(top: 15,),
                                ],
                              ),
                            );
                          }),
                        )

                      ],
                    ),
                  ),

                ],),
            ),), // Example tab content
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.02),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Completed Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        _buildCalendarDialogButton()

                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.04),
                    child: Column(
                      children: [
                        Container(
                          height: 1, width: Get.width, color: AppColors.grey,)
                            .paddingOnly(top: 15,),
                        Container(height: Get.height * .68,
                          child: ListView.builder(itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.bookingdetails,
                                    arguments: "Completed");
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    borderRadius: BorderRadius
                                                        .circular(100)),

                                                child: Center(child: Image.asset(
                                                  ImagesPaths.yoga, scale: 3,))),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("Yoga session with Richard",
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .displayLarge,),
                                                Text("21 Dec . 1.39 pm ",
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .displayMedium,)
                                                    .paddingOnly(top: 10),
                                              ],).paddingOnly(left: 15)
                                          ],
                                        ),
                                        Image.asset(ImagesPaths.eye, scale: 4,),
                                      ],
                                    ).paddingOnly(top: 15, left: 18, right: 18),
                                  ),
                                  Container(height: 1,
                                    width: Get.width,
                                    color: AppColors.grey,).paddingOnly(top: 15,),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),

                ],),
            ),), // Example tab content
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.02),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Canceled Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        _buildCalendarDialogButton()
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0,-Get.height*0.04),
                    child: Column(
                      children: [
                        Container(
                          height: 1, width: Get.width, color: AppColors.grey,)
                            .paddingOnly(top: 15,),
                        Container(height: Get.height * .68,
                          child: ListView.builder(itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.bookingdetails,
                                    arguments: "Cancel");
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: AppColors.grey,
                                                  borderRadius: BorderRadius
                                                      .circular(100)),

                                              child: Center(child: Image.asset(
                                                ImagesPaths.yoga, scale: 3,))),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text("Yoga session with Richard",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .displayLarge,),
                                              Text(
                                                "21 Dec . 1.39 pm ", style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .displayMedium,).paddingOnly(
                                                  top: 10),
                                            ],).paddingOnly(left: 15)
                                        ],
                                      ),
                                      Image.asset(ImagesPaths.eye, scale: 4,),
                                    ],
                                  ).paddingOnly(top: 15, left: 18, right: 18),
                                  Container(height: 1,
                                    width: Get.width,
                                    color: AppColors.grey,).paddingOnly(top: 15,),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),

                ],),
            ),), // Fourth tab content
        ],
      ),
    );
  }


  String _getValueText(CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  _buildCalendarDialogButton() {
    const dayTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle = TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final currentDayTextStyle = TextStyle(
      color: Colors.green, // Green color for the current date
      fontWeight: FontWeight.w700,
    );

    final currentDate = DateTime.now();

    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime.now())) {
          textStyle = currentDayTextStyle; // Applying green color for the current date
        }
        if (date.month == currentDate.month) {
          textStyle = anniversaryTextStyle; // Highlight current month's dates
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final values = await showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                value: _dialogCalendarPickerValue,
                dialogBackgroundColor: Colors.white,
              );
              if (values != null) {
                // ignore: avoid_print
                print(_getValueText(
                  config.calendarType,
                  values,
                ));
                setState(() {
                  _dialogCalendarPickerValue = values;
                });
              }
            },
            child: Icon(Icons.calendar_month,size: 18,),
          ),
        ],
      ),
    );
  }
  // Widget _buildCalendarWithActionButtons() {
  //   final config = CalendarDatePicker2WithActionButtonsConfig(
  //     calendarType: CalendarDatePicker2Type.range,
  //     disableModePicker: true,
  //   );
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 10),
  //       const Text('Date Picker With Action Buttons'),
  //       CalendarDatePicker2WithActionButtons(
  //         config: config,
  //         value: _rangeDatePickerWithActionButtonsWithValue,
  //         onValueChanged: (dates) => setState(
  //                 () => _rangeDatePickerWithActionButtonsWithValue = dates),
  //       ),
  //       const SizedBox(height: 10),
  //       Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text('Selection(s):  '),
  //           const SizedBox(width: 10),
  //           Flexible(
  //             child: Text(
  //               _getValueText(
  //                 config.calendarType,
  //                 _rangeDatePickerWithActionButtonsWithValue,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 25),
  //     ],
  //   );
  // }





}