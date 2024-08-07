import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/booking_controller.dart';
import '../custom_Widgets/common_widgets.dart';
import '../custom_widgets/tabbar_widgets.dart';
import '../utils/app_routes.dart';
import '../utils/image_paths.dart';
final today = DateUtils.dateOnly(DateTime.now());
class BookingUi extends StatefulWidget {
  final initialIndex;
   const BookingUi({super.key,required this.initialIndex});
  @override
  State<BookingUi> createState() => _BookingUiState();
}
class _BookingUiState extends State<BookingUi> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool showCalendar = false;
  RxList _selectedDates = [].obs;
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
    BookingController controller = BookingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          // Upcoming Session ----------------------------------------------------------------
          Container(
            decoration: const BoxDecoration(
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
                                      ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
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
                          child:

                          FutureBuilder(
                              future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"pending" ),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ).paddingOnly(top: 0),
                                  );
                                }else  if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                }else{

                                  return
                                    snapshot.data!.result ==  null ?
                                    SizedBox(
                                      height: Get.height * .7,
                                      child: const Center(
                                        child: Text("No data available",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),),
                                      ).paddingOnly(top: 0),
                                    ):
                                    SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.result!.length,
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
                                                              "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .displayLarge,),
                                                            Text(
                                                              controller.formatDateTime(snapshot.data!.result![index].createdAt.toString(),snapshot.data!.result![index].createdAt.toString()) ,
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
                                    );
                                }
                              }
                          ),
                        )


                      ],
                    ),
                  ),

                ],).paddingOnly(top: 18),
            ),),
          // Ongoing Session ----------------------------------------------------------------
          Container(
            decoration: const BoxDecoration(
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
                                      ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
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
                          child:
                          FutureBuilder(
                              future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"inprogress" ),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ).paddingOnly(top: 0),
                                  );
                                }else  if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                }else{

                                  return
                                    snapshot.data!.result == null ?
                                    SizedBox(
                                      height: Get.height * .7,
                                      child: const Center(
                                        child: Text("No data available",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),),
                                      ).paddingOnly(top: 0),
                                    ):
                                    SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.result!.length,
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
                                                              "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .displayLarge,),
                                                            Text(
                                                              controller.formatDateTime(snapshot.data!.result![index].createdAt.toString(),snapshot.data!.result![index].createdAt.toString()) ,
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
                                    );
                                }
                              }
                          ),

                        )

                      ],
                    ),
                  ),

                ],),
            ),),
          // Completed Session ----------------------------------------------------------------
          Container(
            decoration: const BoxDecoration(
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
                                      ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
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
                          child:
                          FutureBuilder(
                              future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"scheduled" ),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ).paddingOnly(top: 0),
                                  );
                                }else  if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                }else{

                                  return
                                    snapshot.data!.result!.isEmpty ?
                                    SizedBox(
                                      height: Get.height * .7,
                                      child: const Center(
                                        child: Text("No data available",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),),
                                      ).paddingOnly(top: 0),
                                    ):
                                    SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.result!.length,
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
                                                              "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .displayLarge,),
                                                            Text(
                                                              controller.formatDateTime(snapshot.data!.result![index].createdAt.toString(),snapshot.data!.result![index].createdAt.toString()) ,
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
                                    );
                                }
                              }
                          ),
                        )
                      ],
                    ),
                  ),

                ],),
            ),),
          // Canceled Session ----------------------------------------------------------------
          Container(
            decoration: const BoxDecoration(
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
                        Text("Cancelled Sessions", style: Theme
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
                                      ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                      : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
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
                          child:
                          FutureBuilder(
                              future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"cancelled" ),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ).paddingOnly(top: 0),
                                  );
                                }else  if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                }else{

                                  return
                                    snapshot.data!.result!.isEmpty ?
                                    SizedBox(
                                      height: Get.height * .7,
                                      child: const Center(
                                        child: Text("No data available",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),),
                                      ).paddingOnly(top: 0),
                                    ):
                                    SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.result!.length,
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
                                                              "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .displayLarge,),
                                            Text(
                                            controller.formatDateTime(snapshot.data!.result![index].createdAt.toString(),snapshot.data!.result![index].createdAt.toString()) ,
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
                                    );
                                }
                              }
                          ),
                        )
                      ],
                    ),
                  ),

                ],),
            ),),
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
    const anniversaryTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,

    );
    const currentDayTextStyle = TextStyle(
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
      selectedMonthTextStyle: const TextStyle(color: Colors.black),
      selectedYearTextStyle: const TextStyle(color: Colors.black),
      monthTextStyle: const TextStyle(color: Colors.white),
      yearTextStyle: const TextStyle(color: Colors.white),
      selectedRangeDayTextStyle: const TextStyle(color: Colors.white),
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
                 _dialogCalendarPickerValue = values;
                 _selectedDates.value = values;

             }
           },
           icon:const Icon(Icons.calendar_month, size: 18,color: AppColors.yellow,)),
    );
  }
}