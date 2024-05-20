import 'dart:io';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:endoorphin_trainer/bindings/booking_request_binding.dart';
import 'package:endoorphin_trainer/controllers/booking_controller.dart';
import 'package:endoorphin_trainer/controllers/booking_details_controller.dart';
import 'package:endoorphin_trainer/controllers/booking_request_controller.dart';
import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:endoorphin_trainer/controllers/home_controller.dart';
import 'package:endoorphin_trainer/controllers/profile_controller.dart';
import 'package:endoorphin_trainer/controllers/select_category_controller.dart';
import 'package:endoorphin_trainer/controllers/session_details_controller.dart';
import 'package:endoorphin_trainer/controllers/session_running_controller.dart';
import 'package:endoorphin_trainer/pages/booking_request_ui.dart';
import 'package:endoorphin_trainer/pages/select_category_ui.dart';
import 'package:flutter/material.dart';

import '../controllers/otp_controller.dart';
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
// BookingRequestController bookingRequestController = Get.put(BookingRequestController());
  List<Widget> pages = [
    const HomeUi(),
    const EarningUi(),
    const BookingUi(),
    const ProfileUI(),
  ];

  void initializePages() {
    currentPage = pages[widget.currentTabIndex ?? 0];
  }

  @override
  ////
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

        child:
        BottomNavigationBar(
          elevation: 100,
          currentIndex: 0,
          selectedItemColor: AppColors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(color: AppColors.black),
          unselectedLabelStyle: TextStyle(color: AppColors.black),
          onTap: (index) {
            setState(() {
              widget.currentTabIndex = index;
              currentPage = pages[widget.currentTabIndex!];
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(ImagesPaths.home, scale: 5),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesPaths.earningHome, scale: 7),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesPaths.mysession, color: Colors.black,scale: 5),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesPaths.men, scale: 5),
              label: 'Account',
            ),
          ],
        ),
      ),
    // return Scaffold(
    //   backgroundColor: AppColors.backgroundBlack,
    //   bottomNavigationBar: CurvedNavigationBar(
    //     index: 0,
    //     height: Platform.isIOS ? 75 : 60,
    //     buttonBackgroundColor: AppColors.yellow,
    //     animationCurve: Curves.fastEaseInToSlowEaseOut,
    //     backgroundColor: AppColors.backgroundBlack,
    //     color: AppColors.yellow,
    //     animationDuration: const Duration(milliseconds: 500),
    //     onTap: (index) {
    //       setState(() {
    //         widget.currentTabIndex = index;
    //         currentPage = pages[widget.currentTabIndex!];
    //       });
    //     },
    //     items: [
    //       CurvedNavigationBarItem(
    //         child:    Image.asset(ImagesPaths.home,scale: 5,),
    //       ),
    //        CurvedNavigationBarItem(
    //         child:  Image.asset(ImagesPaths.earningHome,scale: 6,),
    //       ),
    //        CurvedNavigationBarItem(
    //         child: Image.asset(ImagesPaths.mysession,scale: 5,color: AppColors.black,),
    //       ),
    //       CurvedNavigationBarItem(
    //         child:
    //           Image.asset(ImagesPaths.men,scale: 5,),
    //         ),
    //       //  CurvedNavigationBarItem(
    //       //   child: Image.asset(ImagesPaths.menu,scale: 5,),
    //       // ),
    //     ],
    //   ),
      body: IndexedStack(
        index: widget.currentTabIndex,
        children: pages,
      ),
    );
  }
}
