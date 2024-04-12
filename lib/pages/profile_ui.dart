
import 'package:flutter/material.dart';

import '../utils/exports.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar(
          title: Text("Profile",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightGrey1)), context: context, ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: AppColors.yellow,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(ImagesPaths.profilePic),
                  ),
                ).paddingOnly(left: 30),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.lightGrey1),),
                    SizedBox(
                      height: Get.height*0.003,
                    ),
                    Text('John.doe@gmail.com',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500,color: AppColors.lightGrey1),),
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
              color: AppColors.impgrey,
            ).paddingOnly(left: Get.width*0.01,right: Get.width*0.01, bottom:Get.height*0.03, top:Get.height*0.03 ),


            Container(
                height: Get.height*0.05,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.greyButton
                ),
                child:
                InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.account);
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.04,
                          ),
                          Image.asset(ImagesPaths.person,width: 16,color: AppColors.lightGrey1,),
                          SizedBox(
                            width: Get.width*0.06,
                          ),
                          Text('Account',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.lightGrey1),),
                        ],
                      ),
                       Transform.translate(
                           offset: const Offset(-10,0),
                           child: const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrey1,size: 20,))
                    ],
                  ),
                )
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            InkWell(
              onTap: (){
                // Get.toNamed(AppRoutes.selectPaymentMethod);
              },
              child: Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.greyButton
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.04,
                          ),
                          Image.asset(ImagesPaths.document,width: 16,color: AppColors.lightGrey1,),
                          SizedBox(
                            width: Get.width*0.06,
                          ),
                          Text('Document',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.lightGrey1),),
                        ],
                      ),
                       Transform.translate(
                           offset: const Offset(-10,0),
                           child: const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrey1,size: 20,))
                    ],
                  )
              ),
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            InkWell(
              onTap: (){
                // Get.toNamed(AppRoutes.memberShip);
              },
              child: Container(
                  height: Get.height*0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.greyButton
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.04,
                          ),
                          Image.asset(ImagesPaths.mysession,width: 16,color: AppColors.lightGrey1,),
                          SizedBox(
                            width: Get.width*0.06,
                          ),
                          Text('My Sessions',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.lightGrey1),),
                        ],
                      ),
                       Transform.translate(
                           offset: const Offset(-10,0),
                           child: const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrey1,size: 20,))
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
                    color: AppColors.greyButton
                ),
                child: InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.wallet);
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.04,
                          ),
                          Image.asset(ImagesPaths.support,width: 16,color: AppColors.lightGrey1,),
                          SizedBox(
                            width: Get.width*0.06,
                          ),
                          Text('Support',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.lightGrey1),),
                        ],
                      ),
                       Transform.translate(
                           offset: const Offset(-10,0),
                           child: const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrey1,size: 20,))
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
                    color: AppColors.greyButton
                ),
                child: InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.previousSessions);
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.04,
                          ),
                          Image.asset(ImagesPaths.my_earning,width: 16,color: AppColors.lightGrey1,),
                          SizedBox(
                            width: Get.width*0.06,
                          ),
                          Text('My Earnings',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: AppColors.lightGrey1),),
                        ],
                      ),
                       Transform.translate(
                           offset: const Offset(-10,0),
                           child: const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrey1,size: 20,))
                    ],
                  ),
                )
            ),
            SizedBox(
              height: Get.height*0.12,
            ),
            InkButton(
                child: Text('Logout',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black),),
                onTap: (){
                  // storage.erase();
                  Get.offAllNamed(AppRoutes.login);
                })
          ],
        ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05),
      ),
    );
  }
}
