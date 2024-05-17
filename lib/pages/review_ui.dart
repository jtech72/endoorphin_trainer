import '../controllers/review_controller.dart';
import '../utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReviewUi extends StatelessWidget {
  const ReviewUi({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewController controller= Get.find();
    return Scaffold(
     appBar: myAppBar(title: Text('Review Your Booking/Trainer',style: Theme.of(context).textTheme.bodyMedium,), context: context,),
      body:
      SingleChildScrollView(
        child: Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.impgrey,
                      borderRadius: BorderRadius.circular(40)),
                  child: Image.asset(
                    ImagesPaths.swim,
                    scale: 2,
                  ),
                ),
                Text(
                  "Richard",
                  style: Theme.of(context).textTheme.headlineSmall,
                ).paddingOnly(top: 10),
                Text(
                  "Lorem Ipsum is simply",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.impgrey),
                ).paddingOnly(top: 10),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  unratedColor: AppColors.impgrey,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                  const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColors.yellow,
                  ),
                  onRatingUpdate: (rating) {
                    controller.writeReviewVisible.value = true;
                  },
                ).paddingOnly(top: 20),
                Obx(
                    ()=> Text(
                      controller.writeReviewVisible.value == false?
                      "Tap the stars to rate":"Check what applies to Richard",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.impgrey))
                      .paddingOnly(top: 10),
                ),
               Obx(
                 ()=> Visibility(
                   visible: controller.writeReviewVisible.value,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         "Write a Review",
                         style: Theme.of(context)
                             .textTheme
                             .labelLarge,
                       ),
                       Container(
                         height: Get.height*0.15,
                         width: Get.width,
                         decoration: BoxDecoration(
                           color: AppColors.greyButton,
                           borderRadius: BorderRadius.circular(5),
                         ),
                         child: const Padding(
                           padding:
                           EdgeInsets.symmetric(horizontal: 12.0),
                           child: TextField(
                             style: TextStyle(
                               color: AppColors.impgrey,
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                             ),
                             maxLines: null,
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.transparent,
                               border: InputBorder.none,
                               hintText: 'Enter your review here',
                               hintStyle:   TextStyle(
                               color: AppColors.lightGrey,
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                             ),
                             ),
                           ),
                         ),
                       ).paddingOnly(top: 10,bottom: Get.height*.07),
                       Center(
                         child: InkButton(child: Text(
                           "Submit",
                           style: Theme.of(context)
                               .textTheme
                               .headlineSmall
                               ?.copyWith(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.w500),
                         ), onTap: (){
                           Get.offAllNamed(AppRoutes.bottomNavigation);

                         }),
                       )
                     ],
                   ).paddingOnly(top: 60),
                 ),
               )


              ],
            ).paddingOnly(top: Get.height*0.03,left: Get.height*0.025,right: Get.height*0.025),
          ),
        ),
      ),

    );
  }
  //
  // Widget card(required, String text) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 3.0, right: 3),
  //     child: Container(
  //       alignment: Alignment.center,
  //       height: 32,
  //       width: 110,
  //       decoration: BoxDecoration(
  //         color: Colors.transparent,
  //         border: Border.all(color: AppColors.yellow),
  //         borderRadius: BorderRadius.circular(40),
  //       ),
  //       child: Text(
  //         text,
  //         style: const TextStyle(
  //             color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
  //       ),
  //     ).paddingOnly(top: 15),
  //   );
  // }
}

