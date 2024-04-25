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
BookingRequestController bookingRequestController = Get.put(BookingRequestController());
ProfileController profileController = Get.put(ProfileController());
// BookingRequestController bookingRequestController = Get.put(BookingRequestController());
  List<Widget> pages = [
    const HomeUi(),
    const EarningUi(),
    const BookingRequsetUi(),
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
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: Platform.isIOS ? 75 : 60,
        buttonBackgroundColor: AppColors.yellow,
        animationCurve: Curves.fastEaseInToSlowEaseOut,
        backgroundColor: AppColors.backgroundBlack,
        color: AppColors.yellow,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            widget.currentTabIndex = index;
            currentPage = pages[widget.currentTabIndex!];
          });
        },
        items: [
          CurvedNavigationBarItem(
            child:    Image.asset(ImagesPaths.home,scale: 5,),
          ),
           CurvedNavigationBarItem(
            child:  Image.asset(ImagesPaths.earningHome,scale: 6,),
          ),
           CurvedNavigationBarItem(
            child: Image.asset(ImagesPaths.mysession,scale: 5,color: AppColors.black,),
          ),
          CurvedNavigationBarItem(
            child:
              Image.asset(ImagesPaths.men,scale: 5,),
            ),
          //  CurvedNavigationBarItem(
          //   child: Image.asset(ImagesPaths.menu,scale: 5,),
          // ),
        ],
      ),
      body: IndexedStack(
        index: widget.currentTabIndex,
        children: pages,
      ),
    );
  }
}
