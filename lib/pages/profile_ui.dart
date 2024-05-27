
import 'package:flutter/material.dart';

import '../utils/exports.dart';
import 'bottom_navigation_bar_ui.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.black,
        elevation: 3,
        titleSpacing: -10,
        leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.bottomNavigation);
            },
            child: Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 18,
                ))),
        title: GestureDetector(onTap: (){Get.offAllNamed(AppRoutes.bottomNavigation);},
          child: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      // appBar:myAppBar(
      //     title: Text("Profile",style: Theme.of(context).textTheme.bodyMedium), context: context, ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: AppColors.yellow,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(ImagesPaths.profilePic),
                    ),
                  ).paddingOnly(left: 30),
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe',style: Theme.of(context).textTheme.headlineSmall,),
                      SizedBox(
                        height: Get.height*0.003,
                      ),
                      Text('John.doe@gmail.com',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500,color: AppColors.white),),
                      SizedBox(
                        height: Get.height*0.003,
                      ),
                      Text('View Activity',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.yellow,fontSize: 12),),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.grey3,
              ).paddingOnly(left: Get.width*0.01,right: Get.width*0.01, bottom:Get.height*0.03, top:Get.height*0.03 ),
                
                
              Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton
                  ),
                  child:
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.account);
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.person,width: 19,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.06,
                            ),
                            Text('Account',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                         Transform.translate(
                             offset: const Offset(-10,0),
                             child: const Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,))
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.document);
                },
                child: Container(
                    height: Get.height*0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.grey3),
                        color: AppColors.greyButton
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.document,width: 22,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.057,
                            ),
                            Text('Document',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                         Transform.translate(
                             offset: const Offset(-10,0),
                             child: const Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,))
                      ],
                    )
                ),
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavigationBarUI(currentTabIndex: 2,)));
                },
                child: Container(
                    height: Get.height*0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.grey3),
                        color: AppColors.greyButton
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.mysession,width: 22,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.057,
                            ),
                            Text('My Sessions',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                         Transform.translate(
                             offset: const Offset(-10,0),
                             child: const Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,))
                      ],
                    )
                ),
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton
                  ),
                  child: InkWell(
                    onTap: (){
                      // Get.toNamed(AppRoutes.support);
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.support,width: 20,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.06,
                            ),
                            Text('Support',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                         Transform.translate(
                             offset: const Offset(-10,0),
                             child: const Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,))
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton
                  ),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.earning);
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.my_earning,width: 20,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.057,
                            ),
                            Text('My Earnings',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                         Transform.translate(
                             offset: const Offset(-10,0),
                             child: const Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,))
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton
                  ),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.bankingDetails);
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.04,
                            ),
                            Image.asset(ImagesPaths.bank,width: 20,color: AppColors.white,),
                            SizedBox(
                              width: Get.width*0.057,
                            ),
                            Text('Bank Information',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 20,).paddingOnly(right: Get.width*0.028)
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: Get.height*0.12,
              ),
              InkButton(
                  child: Text('Logout',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontSize: 18,
                      fontFamily: 'Montserrat'),),
                  onTap: (){
                    storage.erase();
                    Get.offAllNamed(AppRoutes.signinoption);
                  })
            ],
          ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05),
        ),
      ),
    );
  }
}
