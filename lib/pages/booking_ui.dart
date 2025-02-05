import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
final today = DateUtils.dateOnly(DateTime.now());
class BookingUi extends StatefulWidget {
  final int initialIndex;
   const BookingUi({super.key,required this.initialIndex});
  @override
  State<BookingUi> createState() => _BookingUiState();
}
class _BookingUiState extends State<BookingUi> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool showCalendar = false;
  var tabindex = Get.arguments ??0;
  final RxList _selectedDates = [].obs;
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
                                 child:  Obx(() {
                                   return Text(
                                     _selectedDates.isNotEmpty
                                         ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                         : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                     style: const TextStyle(color: Colors.white, fontSize: 10),
                                   );
                                 }),

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
                        FutureBuilder(
                            future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"scheduled" ),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Skeletonizer(
                                    child: SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data?.result!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: AppColors.greyButton,
                                                              ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "snapshot.data!.result!",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(
                                                                "snapshot.data!.",
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
                                  )
                                      :
                                  SizedBox(
                                    height: Get.height * .68,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.result!.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: (){
                                              Get.toNamed(AppRoutes.bookingdetails,
                                                  arguments: snapshot.data!.result![index].id.toString());
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              backgroundImage: CachedNetworkImageProvider(snapshot.data!.result![index].category!.logo.toString())),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(DateFormat('dd MMM yyyy, h:mm a')
                                                                  .format(DateTime.parse(snapshot
                                                                  .data!.result![index].createdAt
                                                                  .toString())),
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
                                            ),
                                          );
                                        }),
                                  );
                              }
                            }
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
                                child: Obx(() {
                                  return Text(
                                    _selectedDates.isNotEmpty
                                        ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                        : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                  );
                                }),

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
                        FutureBuilder(
                            future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"pending" ),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Skeletonizer(
                                    child: SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data?.result!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor: AppColors.greyButton,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "snapshot.data!.result!",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(
                                                                "snapshot.data!.",
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
                                          return InkWell(
                                            onTap: (){
                                              if(snapshot.data!.result![index].pinStatus !=null){
                                                Get.toNamed(AppRoutes.sessionRunning,arguments: {
                                                  "id": snapshot.data!.result![index].id.toString(),
                                                  "pin": snapshot.data!.result![index].sessionPin.toString(),
                                                });
                                              }else{
                                                Get.toNamed(AppRoutes.bookingrequest, arguments: {
                                                  "userId": snapshot.data!.result![index].userId.toString(),
                                                  "trainerId":snapshot.data!.result![index].trainerId.toString(),
                                                  "trainerOnTheWay":snapshot.data!.result![index].trainerOnTheWay.toString(),
                                                  "userLong":"",
                                                  "userLat":"",
                                                  "bookingId":snapshot.data!.result![index].id.toString()
                                                });
                                              }

                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              backgroundImage: CachedNetworkImageProvider(snapshot.data!.result![index].category!.logo.toString())),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(DateFormat('dd MMM yyyy, h:mm a')
                                                                  .format(DateTime.parse(snapshot
                                                                  .data!.result![index].createdAt
                                                                  .toString())),
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
                                            ),
                                          );
                                        }),
                                  );
                              }
                            }
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
                                child: Obx(() {
                                  return Text(
                                    _selectedDates.isNotEmpty
                                        ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                        : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                  );
                                }),

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
                        FutureBuilder(
                            future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"completed" ),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Skeletonizer(
                                    child: SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data?.result!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor: AppColors.greyButton,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "snapshot.data!.result!",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(
                                                                "snapshot.data!.",
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
                                          return GestureDetector(
                                            onTap: (){
                                              Get.toNamed(AppRoutes.bookingdetails,
                                                  arguments: snapshot.data!.result![index].id.toString());
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              backgroundImage: CachedNetworkImageProvider(snapshot.data!.result![index].category!.logo.toString())),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].userName}",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(
                                                                DateFormat('dd MMM yyyy, h:mm a')
                                                                    .format(DateTime.parse(snapshot
                                                                    .data!.result![index].createdAt
                                                                    .toString())),
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
                                            ),
                                          );
                                        }),
                                  );
                              }
                            }
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
                                child: Obx(() {
                                  return Text(
                                    _selectedDates.isNotEmpty
                                        ? _selectedDates.map((date) => DateFormat('MM/dd/yyyy').format(date!)).join(' - ')
                                        : 'Today: ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                  );
                                }),

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
                        FutureBuilder(
                            future: CallAPI.getBookingHistory(id: storage.read("userId").toString(), bookingStatus:"cancelled" ),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Skeletonizer(
                                  // effect: ShimmerEffect(baseColor: AppColors.grey),
                                    child: SizedBox(
                                      height: Get.height * .68,
                                      child: ListView.builder(
                                          itemCount: snapshot.data?.result!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor: AppColors.greyButton,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                width: Get.width*0.6,
                                                                child: Text(
                                                                  "snapshot.data!.result!",
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .displayLarge,),
                                                              ),
                                                              Text(
                                                                "snapshot.data!.",
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
                                          return GestureDetector(
                                            onTap: (){
                                              Get.toNamed(AppRoutes.bookingdetails,
                                                  arguments: snapshot.data!.result![index].id.toString());
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              backgroundImage: CachedNetworkImageProvider(snapshot.data!.result![index].category!.logo.toString())),
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
                                              Text(DateFormat('dd MMM yyyy, h:mm a')
                                                  .format(DateTime.parse(snapshot
                                                  .data!.result![index].createdAt
                                                  .toString())),
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
                                            ),
                                          );
                                        }),
                                  );
                              }
                            }
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



  _buildCalendarDialogButton() {
    const dayTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
    final weekendTextStyle = TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    const anniversaryTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,

    );
    const currentDayTextStyle = TextStyle(
      color: Colors.black,
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
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.black),
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
               // Update the reactive state
               _selectedDates.value = values;
             }
           },
           icon:const Icon(Icons.calendar_month, size: 18,color: AppColors.yellow,)),
    );
  }
}