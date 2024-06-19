import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/bottom_navigation_bar_ui.dart';
import 'app_colors.dart';
import 'image_paths.dart';

class DrawerItem {
  final String title;
  final String imagePath;
  final String route;

  DrawerItem({
    required this.title,
    required this.imagePath,
    required this.route,
  });
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int selectedTileIndex = 0;
  int selectedTile =-1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width*0.78,
      backgroundColor: AppColors.blackShade,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: Get.width*0.02,
          ),
      Row(
                children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.profile);
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(ImagesPaths.profilePic),
                      ),
                    ),
                  SizedBox(width: Get.width*0.06,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.yellow),).paddingOnly(bottom: 5),
                      Text('+91 000-111-5555',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),),
                    ],
                  ),
                ],

              ).paddingOnly(top: Get.height*0.05,left: Get.width*0.09,bottom: Get.height*0.05),

          Container(color: selectedTile == 0 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,
            child: ListTile(
              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.home,
                      scale: 4,
                      color: selectedTile == 0 ? AppColors.black : AppColors.impgrey,),
              SizedBox(
                width: Get.width*0.05,
              ),
              Text("Home",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color:  selectedTile == 0 ? AppColors.black : AppColors.impgrey,),
              ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 0;
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 0,)));

                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 1 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,
            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.mysession,
                      scale: 4,
                    color: selectedTile == 1 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("My Sessions",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 1 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 1; // Set selected index
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 2,)));
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 2 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,
            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.earningHome,
                      scale: 6,
                    color: selectedTile == 2 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("My Earnings",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 2 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 2;
                });
                Get.toNamed(AppRoutes.earning);
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 3 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,
            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.document,
                      scale: 4,
                    color: selectedTile == 3 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("Documents",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 3 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 3;
                });
                Get.toNamed(AppRoutes.document);
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 4 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,

            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.men,
                      scale: 4,
                    color: selectedTile == 4 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("Profile",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 4 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 4;
                });
                Get.toNamed(AppRoutes.profile);
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 5 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,

            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.support,
                      scale: 4,
                    color: selectedTile == 5 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("Support",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 5 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 5;
                });
                Get.back();
              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 6 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,

            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.term,
                      scale: 4,
                    color: selectedTile == 6 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("Terms & Conditions",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 6 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 6;
                });
                Get.back();
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),
          Container(
            color: selectedTile == 7 ? AppColors.yellow : Colors.transparent,height: 55,width: Get.width,

            child: ListTile(

              selectedColor: AppColors.yellow,
              title: Row(
                children: [
                  Image.asset(ImagesPaths.privacy,
                      scale: 4,
                    color: selectedTile == 7 ? AppColors.black : AppColors.impgrey,),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  Text("Privacy Policy",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: selectedTile == 7 ? AppColors.black : AppColors.impgrey,),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedTile = 7;
                });
                Get.back();
                // Add functionality here

              },
            ).paddingOnly(left: Get.width*0.05),
          ),

          // Add more ListTiles for additional items
        ],
      ),
    );
    // return Drawer(
    //
    //   backgroundColor: AppColors.blackShade,
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //
    //       Row(
    //           children: [
    //               CircleAvatar(
    //                 radius: 30,
    //                 backgroundImage: AssetImage(ImagesPaths.profilePic),
    //               ),
    //             SizedBox(width: Get.width*0.06,),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text('John Doe',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.lightGrey1),),
    //                 Text('+91 000-111-5555',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),),
    //               ],
    //             ),
    //           ],
    //
    //         ).paddingOnly(top: Get.height*0.05,left: 20,bottom: Get.height*0.05),
    //       for (int i = 0; i < drawerItems.length; i++)
    //         ListTile(
    //           selected: selectedTileIndex == i,
    //           selectedTileColor: AppColors.yellow,
    //           tileColor: selectedTileIndex == i ? AppColors.yellow : null,
    //           iconColor: selectedTileIndex == i ? Colors.white : AppColors.impgrey,
    //           title: GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 selectedTileIndex = selectedTileIndex == i ? -1 : i;
    //               });
    //               if (selectedTileIndex == i) {
    //                 Get.toNamed(drawerItems[i].route);
    //               }
    //             },
    //             child: Row(
    //               children: [
    //                 Image.asset(drawerItems[i].imagePath, scale: 5, color: selectedTileIndex == i ? Colors.white : AppColors.impgrey).paddingOnly(left: Get.width*0.06),
    //                 SizedBox(width: MediaQuery.of(context).size.width * 0.09),
    //                 Text(
    //                   drawerItems[i].title,
    //                   style: Theme.of(context).textTheme.titleLarge?.copyWith(color: selectedTileIndex == i ? Colors.black : AppColors.impgrey,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //     ],
    //   ),
    // );
  }
}


//