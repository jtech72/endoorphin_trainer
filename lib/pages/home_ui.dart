import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../utils/exports.dart';
class HomeUi extends StatelessWidget {
  const HomeUi({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return       Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.impgrey),
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
                controller.onToggleButton();
              },
              child: SizedBox(
                height: 30,
                width: 43,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: Transform.scale(
                    scale: 0.5,
                    child:
                    Switch(
                      activeTrackColor: AppColors.yellow,
                      activeColor: controller.isTrainerOnline.value ? Colors.yellow : Colors.grey.withOpacity(0.5),
                      inactiveThumbImage: const AssetImage(ImagesPaths.trainerOnline),
                      activeThumbImage: const AssetImage(ImagesPaths.trainerOnline),
                      inactiveThumbColor: Colors.transparent,
                      inactiveTrackColor: Colors.black,
                      value: controller.isTrainerOnline.value,
                      onChanged: (v) {
                        controller.onToggleButton();
                      },
                    ),
                  ),
                ).paddingOnly(left: 12),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.notification);
            },
            icon: Image.asset(ImagesPaths.bell, scale: 4),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child:
          Column(

            children: [
              Container(
                height: Get.height * 0.24,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.currentIndex.value = index;
                  },
                  children: [
                    Image.asset("assets/images/image 8.png", fit: BoxFit.cover),
                    Image.asset("assets/images/image 12.png", fit: BoxFit.cover),
                    Image.asset("assets/images/image 13.png", fit: BoxFit.cover),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Obx(
                    () => GestureDetector(
                  onTap: () {
                    controller.pageController.animateToPage(
                      controller.currentIndex.value,
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: PageViewIndicator(
                    currentSize: 10,
                    otherSize: 10,
                    length: 3,
                    currentColor: AppColors.yellow,
                    currentIndex: controller.currentIndex.value,
                  ),
                ),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Quick ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: AppColors.yellow),
                              children: [
                                TextSpan(
                                  text: "Glance",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                )
                              ])),

                      Obx(
                            () => GestureDetector(
                          onTap: controller.openMenu,
                          child: Container(
                            height: Get.height * 0.035,
                            width: Get.height * 0.14,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.yellow),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  controller.selectedOption1.value,
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.yellow),
                                ),
                                PopupMenuButton<String>(
                                  key: controller.menuKey, // Assign the key here
                                  icon: Transform.translate(
                                    offset: const Offset(0, -8),
                                    child: const Icon(Icons.keyboard_arrow_down, size: 28, color: AppColors.lightGrey),
                                  ),offset: const Offset(0,30),
                                  color: AppColors.blackShade, // Set the background color of the dropdown menu
                                  itemBuilder: (BuildContext context) {
                                    return controller.items2.map<PopupMenuEntry<String>>((String value) {
                                      return PopupMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(color: AppColors.white), // Set the text color of each item
                                        ),
                                      );
                                    }).toList();
                                  },
                                  onSelected: (selectedValue) {
                                    controller.selectedOption1.value = selectedValue;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child:
                      FutureBuilder(

                        future:controller.onDateChange(),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return
                              Skeletonizer(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.quickGlanceList.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20,
                                      mainAxisExtent: 155,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Obx(
                                            () => Container(
                                          height: Get.height * 0.15,
                                          width: Get.width * 0.42,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppColors.greyButton,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: Get.height * 0.09,
                                                width: 140,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.lightBlack,
                                                ),
                                                child: Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  "00",
                                                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(

                                                    color: AppColors.yellow,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8), // Adjust the gap here
                                              Text(
                                                "Totalll",
                                                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: controller.selectedIndex.value ==index?
                                                AppColors.black: AppColors.white,),
                                              ),

                                              const SizedBox(height: 4), // Adjust the gap here
                                              Text(
                                                "controller.",
                                                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: controller.selectedIndex.value ==index?
                                                AppColors.black: AppColors.white,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              );
                          }
                          else  if (snapshot.hasData ) {
                            controller.trainerSessionDetails.value = controller.trainerSessionDetails.value;
                            return
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.quickGlanceList.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 155,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      controller.selectedIndex.value = index;
                                      if (controller.selectedIndex.value == 0) {
                                        Get.toNamed(AppRoutes.earning);
                                      } else if (controller.selectedIndex.value == 1) {
                                      Get.to(const BookingUi(initialIndex: 2,));
                                      } else if (controller.selectedIndex.value == 2) {

                                      } else if (controller.selectedIndex.value == 3) {
                                        Get.toNamed(AppRoutes.booking);
                                      } else {
                                        Get.toNamed(AppRoutes.bookingdetails);
                                      }
                                    },
                                    child:Obx(
                                          () => Container(
                                        height: Get.height * 0.15,
                                        width: Get.width * 0.42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: controller.selectedIndex.value ==index?
                                          AppColors.yellow: AppColors.greyButton,

                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: Get.height * 0.09,
                                                 width: 140,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.lightBlack,
                                              ),
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                index == 2 ? "0" :
                                                index == 0 ?controller.trainerSessionDetails.value.walletAmount == null?"0":controller.trainerSessionDetails.value.walletAmount.toString() :
                                                index == 3 ?controller.trainerSessionDetails.value.upcomingBookingCount == null?"0": controller.trainerSessionDetails.value.upcomingBookingCount.toString()
                                                    :controller.trainerSessionDetails.value.totalSession == null? "0": controller.trainerSessionDetails.value.totalSession.toString(),
                                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(

                                                  color: AppColors.yellow,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8), // Adjust the gap here
                                            Text(
                                              index == 2 ? "Reward" :
                                              index == 0 ? "Total" :
                                              index == 3 ? "Upcoming" : "Total",
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: controller.selectedIndex.value ==index?
                                              AppColors.black: AppColors.white,),
                                            ),

                                            const SizedBox(height: 4), // Adjust the gap here
                                            Text(
                                              controller.quickGlanceList[index],
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: controller.selectedIndex.value ==index?
                                              AppColors.black: AppColors.white,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                          } else  if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          else  if (!snapshot.hasData) {
                            return SizedBox(
                              height: Get.height * .7,
                              child: const Center(
                                child: Text(
                                  'No data available',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                    ),
                  ),

                ],
              ).paddingOnly(left: Get.width*0.04, right:Get.width*0.04, top: Get.height*0.02,bottom: 10),
            ],
          ),
        ),
      ),
    );
  }
}