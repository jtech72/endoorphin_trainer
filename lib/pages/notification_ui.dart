import 'package:endoorphin_trainer/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/exports.dart';

class NotificationUi extends StatelessWidget {
  const NotificationUi({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: myAppBar(
        title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Notification',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.white),
            )),
        context: context,
      ),
      body:

      Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(ImagesPaths.bgBlackShade),
              fit: BoxFit.cover
        )),
        child:
            // Center(child: Text("No notification"),)
            SingleChildScrollView(
              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
              FutureBuilder(
                future: CallAPI.getTodayNotification(trainerId: storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    if (snapshot.data!.result!.isEmpty) {
                      controller.isTodayEmpty.value = false;
                      return SizedBox.shrink();
                    } else {
                      controller.isTodayEmpty.value = false;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          ListView.builder(
                            shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data!.result!.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                      height: Get.height * .05,
                                      width: Get.width * .11,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.blackShade,
                                    ),
                                    child: Image.network(snapshot.data!.result![index].categoryLogo.toString())
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * .7,
                                        child: Text(
                                          snapshot.data!.result![index].message.toString(),
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteShade2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h:mm a')
                                            .format(DateTime.parse(snapshot.data!.result![index].createdAt.toString())),
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.whiteShade2,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: Get.width*0.03),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
              FutureBuilder(
                future: CallAPI.getYesterdayNotification(trainerId: storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    if (snapshot.data!.result!.isEmpty) {
                      controller.isYesterdayEmpty.value = true;
                      return SizedBox.shrink();
                    } else {
                      controller.isYesterdayEmpty.value = false;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yesterday",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data!.result!.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: Get.height * .05,
                                    width: Get.width * .11,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.blackShade,
                                    ),
                                    child:Image.network(snapshot.data!.result![index].categoryLogo.toString())
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * .7,
                                        child: Text(
                                          snapshot.data!.result![index].message.toString(),
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteShade2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h:mm a')
                                            .format(DateTime.parse(snapshot.data!.result![index].createdAt.toString())),
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.whiteShade2,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: Get.width*0.03),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
              FutureBuilder(
                future: CallAPI.getWeeklyNotification(trainerId: storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    if (snapshot.data!.result!.isEmpty) {
                      controller.isWeeklyEmpty.value = true;
                      return SizedBox.shrink();
                    } else {
                      controller.isWeeklyEmpty.value = false;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This week",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data!.result!.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: Get.height * .05,
                                    width: Get.width * .11,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.blackShade,
                                    ),
                                    child: Image.network(snapshot.data!.result![index].categoryLogo.toString())
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * .7,
                                        child: Text(
                                          snapshot.data!.result![index].message.toString(),
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteShade2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h:mm a')
                                            .format(DateTime.parse(snapshot.data!.result![index].createdAt.toString())),
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.whiteShade2,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: Get.width*0.03),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
                          ],
                        ).paddingOnly(left: 25, right: 0, top: 2),
            ),
      ),
    );
  }
}
