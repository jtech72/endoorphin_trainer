import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import '../utils/app_drawer.dart';
import '../utils/exports.dart';
import 'package:endoorphin_trainer/controllers/home_controller.dart';

import 'bottom_navigation_bar_ui.dart';


class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);
  @override
  HomeUiState createState() => HomeUiState();
}
class HomeUiState extends State<HomeUi> {
  final GlobalKey _menuKey = GlobalKey();
  void _openMenu() {
    final dynamic state = _menuKey.currentState;
    state.showButtonMenu();
  }

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % 3;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
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
                      activeTrackColor: AppColors.yellow,
                      activeColor: controller.isTrainerOnline.value ? Colors.yellow : Colors.grey.withOpacity(0.5), // Change switch button color conditionally
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
              Get.toNamed(AppRoutes.notification);
            },
            icon: Image.asset(ImagesPaths.bell, scale: 4,),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
              Container(
                height: Get.height*0.24,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
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
              PageViewIndicator(
                currentSize: 10,
                otherSize: 10,
                length: 3,
                currentColor: AppColors.yellow,
                currentIndex: _currentPage,
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
            onTap: _openMenu,
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
                    key: _menuKey, // Assign the key here
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
                  Container(
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
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 2,)));
                              } else if (controller.selectedIndex.value == 2) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 2,)));
                              } else if (controller.selectedIndex.value == 3) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 2,)));
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
  }
}
//