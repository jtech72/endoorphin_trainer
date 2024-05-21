import 'package:flutter/material.dart';

import '../controllers/booking_controller.dart';
import '../controllers/earning_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
import '../utils/exports.dart';

class BottomNavigationBarUI extends StatefulWidget {
  BottomNavigationBarUI({Key? key, this.currentTabIndex = 0}) : super(key: key);
  int? currentTabIndex;

  @override
  State<BottomNavigationBarUI> createState() => _BottomNavigationBarUIState();
}

class _BottomNavigationBarUIState extends State<BottomNavigationBarUI> {
  late Widget currentPage;
  HomeController homeController = Get.put(HomeController());
  EarningController earningController = Get.put(EarningController());
  BookingController bookingController = Get.put(BookingController());
  ProfileController profileController = Get.put(ProfileController());

  List<Widget> pages = [
    const HomeUi(),
    const EarningUi(),
    const BookingUi(initialIndex: 0,),
    const ProfileUI(),
  ];

  List<Color> iconColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  void initializePages() {
    currentPage = pages[widget.currentTabIndex ?? 0];
  }

  @override
  void initState() {
    initializePages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDF7B9),
              Color(0xFFFEE290),
              Color(0xFFD6BB7F),
              Color(0xFFD4B061),
              Color(0xFFFFD36B),
              Color(0xFFFFF1B1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 100,
          currentIndex: widget.currentTabIndex ?? 0,
          selectedItemColor: AppColors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(color: AppColors.white),
          unselectedLabelStyle: const TextStyle(color: AppColors.black,),
          onTap: (index) {
            setState(() {
              widget.currentTabIndex = index;
              currentPage = pages[widget.currentTabIndex!];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                  ImagesPaths.home,
              scale :widget.currentTabIndex ==0 ? 4.5 : 5.8
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImagesPaths.earningHome,
                scale: widget.currentTabIndex == 1 ? 6 : 7,
                color: iconColors[1],
              ),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImagesPaths.mysession,
                scale: widget.currentTabIndex == 2 ? 4 : 5, // Increase scale when selected
                color: iconColors[2],
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImagesPaths.men,
                scale: widget.currentTabIndex == 3 ? 4 : 5, // Increase scale when selected
                color: iconColors[3],
              ),
              label: 'Profile',
            ),

          ],
        ),
      ),
      body: IndexedStack(
        index: widget.currentTabIndex ?? 0,
        children: pages,
      ),
    );
  }

}