import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:endoorphin_trainer/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  List<DateTime?> _selectedDates = [];
  late CalendarDatePicker2WithActionButtonsConfig config;


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
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: AppColors.impgrey),
      //   title: Obx(
      //         () =>
      //         Text(
      //           controller.isTrainerOnline.value ? 'Online' : 'Offline',
      //           style: Theme
      //               .of(context)
      //               .textTheme
      //               .headlineSmall,
      //         ),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Obx(
      //           () =>
      //           InkWell(
      //             splashColor: Colors.transparent,
      //             onTap: () {
      //               controller.isTrainerOnline.value =
      //               !controller.isTrainerOnline.value;
      //             },
      //             child: SizedBox(
      //               height: 15,
      //               width: 43,
      //               child: Container(
      //                 height: 15,
      //                 width: 15,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(30),
      //                   border: Border.all(color: Colors.white),
      //                   color: controller.isTrainerOnline.value
      //                       ? Colors.yellow
      //                       : Colors.grey.withOpacity(
      //                       0.5), // Change container color conditionally
      //                 ),
      //                 child: Transform.scale(
      //                   scale: 0.4,
      //                   child: Switch(
      //                     activeTrackColor: AppColors.yellow,
      //                     activeColor: controller.isTrainerOnline.value ? Colors
      //                         .yellow : Colors.grey.withOpacity(0.5),
      //                     // Change switch button color conditionally
      //                     inactiveThumbImage: AssetImage(
      //                         ImagesPaths.trainerOnline),
      //                     activeThumbImage: AssetImage(
      //                         ImagesPaths.trainerOnline),
      //                     inactiveThumbColor: Colors.transparent,
      //                     inactiveTrackColor: Colors.black,
      //                     value: controller.isTrainerOnline.value,
      //                     onChanged: (v) {
      //                       controller.isTrainerOnline.value = !controller
      //                           .isTrainerOnline.value;
      //                     },
      //                   ),
      //                 ),
      //               ).paddingOnly(left: 20),
      //             ),
      //           ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         Get.toNamed(AppRoutes.notification);
      //       },
      //       icon: Image.asset(ImagesPaths.bell, scale: 4,),
      //     ),
      //   ],
      //   bottom: myTabBar(tabController, context),
      // ),
      // drawer: MyDrawer(),
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
              Get.offAllNamed(AppRoutes.bottomNavigation);
            },
            child: Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 18,
                ))),
        title: GestureDetector(onTap: (){Get.offAllNamed(AppRoutes.bottomNavigation);},
          child: Text(
            "Booking History",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        bottom: myTabBar(tabController, context),
      ),
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
                    offset: Offset(0,-Get.height*0.035),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upcoming Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                          left: 18,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black, // AppColors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  _selectedDates.isNotEmpty
                                      ? '${_selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')}'
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            _buildCalendarDialogButton(),
                          ],
                        ),




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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,
                                arguments: "Upcomming");
                          },
                          child: Container(
                            height: Get.height * .68,
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Column(
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
                                  );
                                }),
                          ),
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
                    offset: Offset(0,-Get.height*0.015),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ongoing Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black, // AppColors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  _selectedDates.isNotEmpty
                                      ? '${_selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')}'
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            _buildCalendarDialogButton(),
                          ],
                        ),
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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(
                                AppRoutes.bookingdetails, arguments: "");
                          },
                          child: Container(
                            height: Get.height * .68,
                            child: ListView.builder(itemBuilder: (context, index) {
                              return Column(
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
                              );
                            }),
                          ),
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
                    offset: Offset(0,-Get.height*0.015),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Completed Sessions", style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,).paddingOnly(
                            left: 18,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black, // AppColors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  _selectedDates.isNotEmpty
                                      ? '${_selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')}'
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            _buildCalendarDialogButton(),
                          ],
                        ),

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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,
                                arguments: "Completed");
                          },
                          child: Container(height: Get.height * .68,
                            child: ListView.builder(itemBuilder: (context, index) {
                              return Column(
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
                              );
                            }),
                          ),
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
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black, // AppColors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  _selectedDates.isNotEmpty
                                      ? '${_selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')}'
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            _buildCalendarDialogButton(),
                          ],
                        ),
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
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,
                                arguments: "Cancel");
                          },
                          child: Container(height: Get.height * .68,
                            child: ListView.builder(itemBuilder: (context, index) {
                              return Column(
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
                              );
                            }),
                          ),
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
    const dayTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
    final weekendTextStyle = TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,

    );
    final currentDayTextStyle = TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w700,
    );

    final currentDate = DateTime.now();

    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: AppColors.yellow,
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: AppColors.yellow,
        fontWeight: FontWeight.bold,
      ),
      selectedMonthTextStyle: TextStyle(color: Colors.black),
      selectedYearTextStyle: TextStyle(color: Colors.black),
      monthTextStyle: TextStyle(color: Colors.white),
      yearTextStyle: TextStyle(color: Colors.white),
      selectedRangeDayTextStyle: TextStyle(color: Colors.white),
      controlsTextStyle: const TextStyle(
        color: AppColors.yellow,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
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
                        color: isSelected == true ? Colors.white : Colors.grey[500],
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
      padding: const EdgeInsets.only(left:0,right: 0,top: 10,bottom: 10),
      child: IconButton(
           onPressed: () async {
             List<DateTime?> _dialogCalendarPickerValue = [DateTime.now()];

             final values = await showCalendarDatePicker2Dialog(
               context: context,
               config: config,
               dialogSize: const Size(325, 400),
               borderRadius: BorderRadius.circular(15),
               value: _dialogCalendarPickerValue,
               dialogBackgroundColor: AppColors.greyButton,
             );
             if (values != null) {
               // ignore: avoid_print
               print(_getValueText(
                 config.calendarType,
                 values,
               ));
               setState(() {
                 _dialogCalendarPickerValue = values;
                 _selectedDates = values;

               });
             }
           },
           icon:Icon(Icons.calendar_month, size: 18,color: AppColors.yellow,)),
    );
  }






}