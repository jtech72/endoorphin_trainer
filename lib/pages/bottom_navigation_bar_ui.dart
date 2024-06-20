import 'dart:io';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:endoorphin_trainer/controllers/booking_controller.dart';
import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:endoorphin_trainer/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import '../controllers/home_controller.dart';
import '../controllers/otp_controller.dart';
import '../utils/exports.dart';

class BottomNavigationBarUI extends StatefulWidget {
  BottomNavigationBarUI({Key? key, this.currentTabIndex = 0}) : super(key: key);
  int? currentTabIndex;
  List<String>pics = [
    ImagesPaths.home,
    ImagesPaths.earningHome,
    ImagesPaths.history,
    ImagesPaths.profile,
  ];  @override
  State<BottomNavigationBarUI> createState() => _BottomNavigationBarUIState();
}

class _BottomNavigationBarUIState extends State<BottomNavigationBarUI> {
  late Widget currentPage;
  HomeController homeController = Get.put(HomeController());
  EarningController earningController = Get.put(EarningController());
  BookingController bookingController = Get.put(BookingController());
  ProfileController profileController = Get.put(ProfileController());
  CountryCodeController countryCodeController = Get.put(CountryCodeController());

  List<Widget> pages = [
    const HomeUi(),
    const EarningUi(),
    BookingUi(initialIndex: 0),
    ProfileUI(),
  ];

  List<double> labelFontSizes = [10, 10, 10, 10]; // Initial font sizes

  @override
  void initState() {
    initializePages();
    super.initState();
  }

  void initializePages() {
    currentPage = pages[widget.currentTabIndex ?? 0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(

          gradient: LinearGradient(
            colors: [
              Color(0XFFFDF7B9),
              Color(0XFFFEE290),
              Color(0XFFD6BB7F),
              Color(0XFFD4B061),
              Color(0XFFFFD36B),
              Color(0XFFFFF1B1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child:
        CurvedNavigationBar(
          index: widget.currentTabIndex ?? 0,
          height: Platform.isIOS ? 75 : 60,
          buttonBackgroundColor: Colors.transparent,
          animationCurve: Curves.fastEaseInToSlowEaseOut,
          backgroundColor: Colors.transparent,
          color: Colors.transparent,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              widget.currentTabIndex = index;
              currentPage = pages[widget.currentTabIndex!];
              updateLabelFontSizes(index);
            });
          },
          items: [
            _buildNavigationBarItem('Home', ImagesPaths.home, 5, labelFontSizes[0]),
            _buildNavigationBarItem('Earnings', ImagesPaths.earningHome, 7, labelFontSizes[1]),
            _buildNavigationBarItem('History', ImagesPaths.mysessionhome, 5, labelFontSizes[2]),
            _buildNavigationBarItem('Account', ImagesPaths.men, 5, labelFontSizes[3]),
          ],
        ),

      ),
      body: IndexedStack(
        index: widget.currentTabIndex!,
        children: pages,
      ),
    );
  }

  void updateLabelFontSizes(int selectedIndex) {
    for (int i = 0; i < labelFontSizes.length; i++) {
      if (i == selectedIndex) {
        labelFontSizes[i] = 14;
      } else {
        labelFontSizes[i] = 10;
      }
    }
  }

  CurvedNavigationBarItem _buildNavigationBarItem(String label, String assetPath, double scale, double fontSize) {
    return CurvedNavigationBarItem(
      label: label,
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
      child: _buildGradientButton(assetPath, scale),

    );
  }

  Widget _buildGradientButton(String assetPath, double scale) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0XFFFDF7B9),
            Color(0XFFFEE290),
            Color(0XFFD6BB7F),
            Color(0XFFD4B061),
            Color(0XFFFFD36B),
            Color(0XFFFFF1B1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          assetPath,
          scale: scale,
        ),
      ),
    );
  }
}

