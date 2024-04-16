import 'package:endoorphin_trainer/controllers/home_controller.dart';
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
        leading:  GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.bookingrequest);
          },
          child: Icon(
            Icons.menu,
            size: 28,
          ).paddingOnly(left: 15),
        ),
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
                width: 50,
                child: Container(
                  height: 15,
                  width: 25,
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
                ).paddingOnly(right: 15,left: 10),
              ).paddingOnly(right: 15),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.notification);
              },
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
            SizedBox(
              height: Get.height * .59,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.quickGlanceList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    mainAxisExtent: 160
                      ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: Get.height*.16,
                          width: Get.width*.42,
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
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightBlack,
                                ),
                                child: Text(
                                  "50",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          color: AppColors.yellow,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(index == 3 ? "Upcoming" : "Total",
                                  style: Theme.of(context).textTheme.titleLarge),
                              Text(controller.quickGlanceList[index],
                                  style: Theme.of(context).textTheme.titleLarge),

                            ],
                          ),
                        ),
                      ],
                    );
                  }),
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
                        },
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * .14,
                              width: Get.width * .29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
        ).paddingOnly(left: 25, right: 20, top: 0,bottom: 10),
      ),
    );
  }
}
