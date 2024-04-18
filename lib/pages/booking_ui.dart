import 'package:endoorphin_trainer/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../custom_widgets/tabbar_widgets.dart';
import '../utils/app_routes.dart';
import '../utils/image_paths.dart'; // assuming this file contains myTabBar function

class BookingUi extends StatefulWidget {
  const BookingUi({Key? key}) : super(key: key);

  @override
  State<BookingUi> createState() => _BookingUiState();
}

class _BookingUiState extends State<BookingUi> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
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
      appBar: AppBar(
        title: Text(
          'Offline',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.bookingrequest); // assuming you have AppRoutes defined
          },
          child: const Icon(
            Icons.menu,
            size: 28,
            color: Colors.white,
          ).paddingOnly(left: 15),
        ),
        actions: [
          Obx(
                () => InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.isTrainerOnline.value = !controller.isTrainerOnline.value;
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
                  ),
                  child: Transform.scale(
                    scale: 0.4,
                    child: Switch(
                      activeTrackColor: Colors.black,
                      activeColor: Colors.transparent,
                      inactiveThumbImage: const AssetImage(ImagesPaths.trainerOnline),
                      activeThumbImage: const AssetImage(ImagesPaths.trainerOnline),
                      inactiveThumbColor: Colors.transparent,
                      inactiveTrackColor: Colors.black,
                      value: controller.isTrainerOnline.value,
                      onChanged: (v) {
                        controller.isTrainerOnline.value = !controller.isTrainerOnline.value;
                      },
                    ),
                  ),
                ).paddingOnly(left: 20),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.notification); // assuming you have AppRoutes defined
            },
            icon: Image.asset(ImagesPaths.bell, scale: 4,),
          )
        ],
        bottom: myTabBar(tabController, context), // assuming you import myTabBar from tabbar_widgets.dart
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.bookingdetails);
                  },
                  child: Text("Upcoming",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15)),
              Column(
                children: [
                  Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                              child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                            Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                          ],).paddingOnly(left: 15)
                        ],
                      ),
                      Image.asset(ImagesPaths.eye, scale: 4,),
                    ],
                  ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),
            
                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                ],
              ),
            
            ],),
          ),), // Example tab content
          Container(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ongoing",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                  ],
                ),

              ],),
          ),), // Example tab content
          Container(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Completed",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                  ],
                ),

              ],),
          ),), // Example tab content
           Container(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Canceled",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.circular(100)),

                                child: Center(child: Image.asset(ImagesPaths.yoga,scale: 3,))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga session with Richard", style: Theme.of(context).textTheme.displayLarge,),
                                Text("21 Dec . 1.39 pm ",style: Theme.of(context).textTheme.displayMedium,).paddingOnly(top: 10),
                              ],).paddingOnly(left: 15)
                          ],
                        ),
                        Image.asset(ImagesPaths.eye, scale: 4,),
                      ],
                    ).paddingOnly(top: 15,left: 18,right: 18),
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                  ],
                ),

              ],),
          ),),  // Fourth tab content
        ],
      ),
    );
  }
}