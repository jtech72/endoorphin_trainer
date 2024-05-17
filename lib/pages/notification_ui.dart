import 'package:flutter/material.dart';
import '../utils/exports.dart';


class NotificationUi extends StatelessWidget {
  const NotificationUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: myAppBar(title:Text('Notification',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightGrey1),), context: context, ),
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.075,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(Icons.arrow_back_ios,size: 18,).paddingOnly(right: Get.width*0.02)),
                  ),
                  Text('Notification',
                    style: Theme.of(context).textTheme.headlineSmall,),
                ],
              ).paddingOnly(left: Get.width*0.04,bottom: Get.height*0.02),
              Text("Today",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.yellow,fontWeight: FontWeight.w400),).paddingOnly(bottom: 4),
              Container(
                alignment: Alignment.topLeft,
                height: Get.height*.25,
                child: ListView.builder(padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context,index){
                  return Row(
                    children: [

                      Container(
                        alignment: Alignment.center,
                        height: Get.height*.1,
                        width: Get.width*.15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blackShade,
                        ),
                        child: Image.asset(
                          ImagesPaths.boxing,
                          height: Get.height*.06,
                          width: Get.width*.06,),
                      ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       width: Get.width*.7,
                       child: Text("Lorem Ipsum has been the industry's standard Lorem Ipsum has been the",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.grey
                            ),),
                     ),
                     Text("9:01AM",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,fontSize: 10,color: AppColors.grey),)

                   ],
                 ).paddingOnly(left: 8),
                    ],
                  );
                }),
              ),
              Text("Yesterday",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.yellow,fontWeight: FontWeight.w400),).paddingOnly(bottom: 4),
              Container(
                alignment: Alignment.topLeft,
                height: Get.height*.25,
                child: ListView.builder(padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context,index){
                  return Row(
                    children: [

                      Container(
                        alignment: Alignment.center,
                        height: Get.height*.1,
                        width: Get.width*.15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blackShade,
                        ),
                        child: Image.asset(
                          ImagesPaths.boxing,
                          height: Get.height*.06,
                          width: Get.width*.06,),
                      ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       width: Get.width*.7,
                       child: Text("Lorem Ipsum has been the industry's standard Lorem Ipsum has been the",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.grey
                            ),),
                     ),
                     Text("9:01AM",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,fontSize: 10,color: AppColors.grey),)

                   ],
                 ).paddingOnly(left: 8),
                    ],
                  );
                }),
              ),
              Text("This week",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.yellow,fontWeight: FontWeight.w400),).paddingOnly(bottom: 4),
              Container(
                alignment: Alignment.topLeft,
                height: Get.height*.25,
                child: ListView.builder(padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context,index){
                  return Row(
                    children: [

                      Container(
                        alignment: Alignment.center,
                        height: Get.height*.1,
                        width: Get.width*.15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blackShade,
                        ),
                        child: Image.asset(
                          ImagesPaths.boxing,
                          height: Get.height*.06,
                          width: Get.width*.06,),
                      ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       width: Get.width*.7,
                       child: Text("Lorem Ipsum has been the industry's standard Lorem Ipsum has been the",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.grey
                            ),),
                     ),
                     Text("9:01AM",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,fontSize: 10,color: AppColors.grey),)

                   ],
                 ).paddingOnly(left: 8),
                    ],
                  );
                }),
              ),
            ],
          ).paddingOnly(left: 25,right: 0,top: 2),
        ],
      ),
    );
  }
}
