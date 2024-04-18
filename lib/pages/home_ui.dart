
import 'package:endoorphin_trainer/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';
class HomeUi extends StatelessWidget {
  const HomeUi({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Offline',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        leading:  const Icon(
          Icons.menu,
          size: 28,
          color: Colors.white,
        ).paddingOnly(left: 15),
        actions: [
          Obx(
                () => InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.isTrainerOnline.value =
                !controller.isTrainerOnline.value;
              },
              child: SizedBox(
                height: 15,
                width: 43,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.white)),
                  child: Transform.scale(
                    scale: 0.4,
                    child: Switch(
                        activeTrackColor: AppColors.black,
                        activeColor: Colors.transparent,
                        inactiveThumbImage:
                        const AssetImage(ImagesPaths.trainerOnline),
                        activeThumbImage:
                        const AssetImage(ImagesPaths.trainerOnline),
                        inactiveThumbColor: Colors.transparent,
                        inactiveTrackColor: AppColors.black,
                        value: controller.isTrainerOnline.value,
                        onChanged: (v) {
                          controller.isTrainerOnline.value =
                          !controller.isTrainerOnline.value;
                        }),
                  ),
                ).paddingOnly(left: 20),
              ),
            ),
          ),
          IconButton(onPressed: (){Get.toNamed(AppRoutes.notification);}, icon: Image.asset(ImagesPaths.bell,scale: 4,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(10,0),
              child: RichText(
                  text: TextSpan(
                      text: "Quick ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.yellow),
                      children: [
                        TextSpan(
                          text: "Glance",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ])).paddingOnly(bottom: 15),
            ),
            Container(
              height: Get.height * 0.53,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5), // Adjust the horizontal padding here
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.quickGlanceList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 130,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        controller.selectedIndex.value = index;
                        // Use Get.toNamed to navigate to the desired routes based on the selected index
                        if (controller.selectedIndex.value == 0) {
                          Get.toNamed(AppRoutes.bookingdetails);
                        } else if (controller.selectedIndex.value == 1) {
                          Get.toNamed(AppRoutes.bookingdetails);
                        } else if (controller.selectedIndex.value == 2) {
                          Get.toNamed(AppRoutes.bookingdetails);
                        } else if (controller.selectedIndex.value == 3) {
                          Get.toNamed(AppRoutes.bookingdetails);
                        } else {
                          Get.toNamed(AppRoutes.booking);
                        }
                      },
                      child: Container(
                        height: Get.height * 0.15,
                        width: Get.width * 0.42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.greyButton,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.06,
                              width: Get.width * 0.12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightBlack,
                              ),
                              child: Text(
                                "50",
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColors.yellow,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 8), // Adjust the gap here
                            Text(
                              index == 3 ? "Upcoming" : "Total",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 4), // Adjust the gap here
                            Text(
                              controller.quickGlanceList[index],
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    text: "Quick ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.yellow),
                    children: [
                      TextSpan(
                        text: "Access",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ])).paddingOnly(bottom: 15),
            SizedBox(
              height: Get.height * .18,
              width: Get.width,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                          ()=> InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          controller.selectedIndex.value = index;
                          if (controller.selectedIndex.value == 0) {
                            Get.toNamed(AppRoutes.profile);
                          } else if (controller.selectedIndex.value == 1) {
                            Get.toNamed(AppRoutes.earning);
                          } else {
                            Get.toNamed(AppRoutes.document);
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * .14,
                              width: Get.width * .29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                controller.selectedIndex.value ==index?
                                AppColors.yellow: AppColors.greyButton,
                              ),
                              child: Image.asset(
                                index == 0
                                    ? ImagesPaths.profileHome
                                    : index == 1
                                    ? ImagesPaths.earningHome
                                    : ImagesPaths.documentHome,
                                scale: 3,
                                color:controller.selectedIndex.value==index?AppColors.black: AppColors.white,
                              ),
                            ),
                            Text(
                              index == 0
                                  ? "Profile"
                                  : index == 1
                                  ? "Earning"
                                  : "Documents",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ).paddingOnly(top: 9)
                          ],
                        ).paddingOnly(right: 20),
                      ),
                    );
                  }),
            )
          ],
        ).paddingOnly(left: Get.width*0.04, right:Get.width*0.04, top: 0,bottom: 0),
      ),
    );
  }
}
