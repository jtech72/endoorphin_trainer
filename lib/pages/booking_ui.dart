import 'package:endoorphin_trainer/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../custom_widgets/tabbar_widgets.dart';
import '../utils/app_routes.dart';
import '../utils/image_paths.dart';
import '../utils/app_drawer.dart'; // assuming this file contains myTabBar function

class BookingUi extends StatefulWidget {
  final initialIndex;
  const BookingUi({super.key,required this.initialIndex});

  @override
  State<BookingUi> createState() => _BookingUiState();
}

class _BookingUiState extends State<BookingUi> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this,initialIndex:widget.initialIndex??0);
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
              () => Text(
            controller.isTrainerOnline.value ? 'Online' : 'Offline',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: true,
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
                    color: controller.isTrainerOnline.value ? Colors.yellow : Colors.grey.withOpacity(0.5), // Change container color conditionally
                  ),
                  child: Transform.scale(
                    scale: 0.4,
                    child: Switch(
                      activeTrackColor: Colors.black,
                      activeColor: controller.isTrainerOnline.value ? Colors.yellow : Colors.grey.withOpacity(0.5), // Change switch button color conditionally
                      inactiveThumbImage: AssetImage(ImagesPaths.trainerOnline),
                      activeThumbImage: AssetImage(ImagesPaths.trainerOnline),
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
                    image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text("Upcoming Sessions",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
              Column(
                children: [
                  Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                  Container(
                    height: Get.height*.68,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.bookingdetails,arguments: "Upcomming");
                        },
                        child: Column(
                          children: [
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
                      );
                    }),
                  )


                ],
              ),
            
            ],),
          ),), // Example tab content
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ongoing Sessions",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Container(
                      height: Get.height*.68,
                      child: ListView.builder(itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,arguments: "");
                          },
                          child: Column(
                            children: [
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
                        );
                      }),
                    )
                
                  ],
                ),

              ],),
          ),), // Example tab content
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Completed Sessions",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Container( height: Get.height*.68,
                      child: ListView.builder(itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,arguments: "Completed");
                          },
                          child: Column(
                            children: [
                              Container(
                                child: Row(
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
                              ),
                              Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),

              ],),
          ),), // Example tab content
           Container(
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                 )
             ),
             child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Canceled Sessions",style: Theme.of(context).textTheme.headlineSmall,).paddingOnly(left: 18,right: 18,top: 15),
                Column(
                  children: [
                    Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,),
                    Container( height: Get.height*.68,
                      child: ListView.builder(itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.bookingdetails,arguments: "Cancel");
                          },
                          child: Column(
                            children: [
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
                        );
                      }),
                    )
                  ],
                ),

              ],),
          ),),  // Fourth tab content
        ],
      ),
    );
  }
}
