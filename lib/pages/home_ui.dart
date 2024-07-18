import 'package:endoorphin_trainer/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import '../utils/app_drawer.dart';
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
              child: Container(
                height: 30,
                width: 43,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: Transform.scale(
                    scale: 0.5,
                    child: Switch(
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
                height: Get.height*0.24,
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
                    Image.asset(ImagesPaths.homepackage, fit: BoxFit.fill),
                    Image.asset(ImagesPaths.homepackage, fit: BoxFit.fill),
                    Image.asset(ImagesPaths.homepackage, fit: BoxFit.fill),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.01,
              ),
              Obx(
                ()=> PageViewIndicator(
                  currentSize: 10,
                  otherSize: 10,
                  length: 3,
                  currentColor: AppColors.yellow,
                  currentIndex: controller.currentIndex.value,
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
                    height: Get.height * 0.53,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GridView.builder(
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
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => const BookingUi(initialIndex: 2),
                                    transitionDuration: const Duration(milliseconds: 600),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );

                              } else if (controller.selectedIndex.value == 2) {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => const BookingUi(initialIndex: 2),
                                    transitionDuration: const Duration(milliseconds: 600),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              } else if (controller.selectedIndex.value == 3) {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => const BookingUi(initialIndex: 0),
                                    transitionDuration: const Duration(milliseconds: 600),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
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
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.14,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.lightBlack,
                                      ),
                                      child: Text(
                                        "0",
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
                      ),
                    ),
                  ),

                ],
              ).paddingOnly(left: Get.width*0.04, right:Get.width*0.04, top: Get.height*0.02,),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
