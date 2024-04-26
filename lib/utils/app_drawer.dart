import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  // List<DrawerItem> drawerItems = [
  //   DrawerItem(title: 'Home', imagePath: ImagesPaths.home, route: '/bottomNavigation'),
  //   DrawerItem(title: 'My Sessions', imagePath: ImagesPaths.mysession, route: '/bookingdetails'),
  //   DrawerItem(title: 'My Earnings', imagePath: ImagesPaths.my_earning, route: '/earning'),
  //   DrawerItem(title: 'Documents', imagePath: ImagesPaths.document, route: '/document'),
  //   DrawerItem(title: 'Profile', imagePath: ImagesPaths.myprofile, route: '/profile'),
  //   DrawerItem(title: 'Support', imagePath: ImagesPaths.mysupport, route: '/support'),
  //   DrawerItem(title: 'Terms & Conditions', imagePath: ImagesPaths.myconditions, route: '/page7'),
  //   DrawerItem(title: 'Privacy Policy', imagePath: ImagesPaths.myprivacy, route: '/page8'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ImagesPaths.profilePic),
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

              ).paddingOnly(top: Get.height*0.05,left: 20,bottom: Get.height*0.05),

          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.home,
                    scale: 4.5,
                    color: AppColors.impgrey),
            SizedBox(
              width: Get.width*0.05,
            ),
            Text("Home",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
            ),
              ],
            ),
            onTap: () {
              Get.back();
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.mysession,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("My Sessions",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(AppRoutes.bookingrequest);
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.earningHome,
                    width: 18,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("My Earnings",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(AppRoutes.earning);
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.document,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("Documents",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(AppRoutes.document);
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.men,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("Profile",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(AppRoutes.profile);
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.support,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("Support",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(AppRoutes.support);
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.term,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("Terms & Conditions",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.back();
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),
          ListTile(

            selectedColor: AppColors.yellow,
            title: Row(
              children: [
                Image.asset(ImagesPaths.privacy,
                    scale: 4.5,
                    color: AppColors.impgrey),
                SizedBox(
                  width: Get.width*0.05,
                ),
                Text("Privacy Policy",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500,color: AppColors.impgrey,),
                ),
              ],
            ),
            onTap: () {
              Get.back();
              // Add functionality here

            },
          ).paddingOnly(left: Get.width*0.05),

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


