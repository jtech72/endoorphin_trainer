import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/image_paths.dart';


class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int selectedTileIndex = -1;

  List<DrawerItem> drawerItems = [
    DrawerItem(title: 'Home', imagePath: ImagesPaths.home, route: '/bottomNavigation'),
    DrawerItem(title: 'My Sessions', imagePath: ImagesPaths.mysession, route: '/sessionRunning'),
    DrawerItem(title: 'My Earnings', imagePath: ImagesPaths.my_earning, route: '/earning'),
    DrawerItem(title: 'Documents', imagePath: ImagesPaths.document, route: '/document'),
    DrawerItem(title: 'Profile', imagePath: ImagesPaths.myprofile, route: '/profile'),
    DrawerItem(title: 'Support', imagePath: ImagesPaths.mysupport, route: '/support'),
    DrawerItem(title: 'Terms & Conditions', imagePath: ImagesPaths.myconditions, route: '/page7'),
    DrawerItem(title: 'Privacy Policy', imagePath: ImagesPaths.myprivacy, route: '/page8'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blackShade,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

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
                    Text('John Doe',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.lightGrey1),),
                    Text('+91 000-111-5555',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),),
                  ],
                ),
              ],

            ).paddingOnly(top: Get.height*0.05,left: 20,bottom: Get.height*0.05),
          for (int i = 0; i < drawerItems.length; i++)
            ListTile(
              selected: selectedTileIndex == i,
              selectedTileColor: AppColors.yellow,
              tileColor: selectedTileIndex == i ? AppColors.yellow : null,
              iconColor: selectedTileIndex == i ? Colors.white : AppColors.impgrey,
              title: InkWell(
                onTap: () {
                  setState(() {
                    selectedTileIndex = selectedTileIndex == i ? -1 : i;
                  });
                  if (selectedTileIndex == i) {
                    Get.toNamed(drawerItems[i].route);
                  }
                },
                child: Row(
                  children: [
                    Image.asset(drawerItems[i].imagePath, scale: 5, color: selectedTileIndex == i ? Colors.white : AppColors.impgrey).paddingOnly(left: Get.width*0.06),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                    Text(
                      drawerItems[i].title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: selectedTileIndex == i ? Colors.black : AppColors.impgrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

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

