import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/notification_controller.dart';
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
          ),
        ),
        context: context,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPaths.bgBlackShade),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: Future.wait([
                  CallAPI.getTodayNotification(trainerId: storage.read("userId").toString()),
                  CallAPI.getYesterdayNotification(trainerId: storage.read("userId").toString()),
                  CallAPI.getWeeklyNotification(trainerId: storage.read("userId").toString()),
                ]),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()).paddingOnly(top: Get.height*0.4,right: Get.width*.1);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    final todayData = snapshot.data![0];
                    final yesterdayData = snapshot.data![1];
                    final weekData = snapshot.data![2];

                    final isTodayEmpty = todayData.result?.isEmpty ?? true;
                    final isYesterdayEmpty = yesterdayData.result?.isEmpty ?? true;
                    final isWeeklyEmpty = weekData.result?.isEmpty ?? true;

                    if (isTodayEmpty && isYesterdayEmpty && isWeeklyEmpty) {
                      return Center(
                        child: Text(
                          'No notification available',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.white),
                        ).paddingOnly(top: Get.height*0.4,right: Get.width*.1),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isTodayEmpty) ...[
                          Text(
                            "Today",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          buildNotificationList(context, todayData),
                        ],
                        if (!isYesterdayEmpty) ...[
                          Text(
                            "Yesterday",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          buildNotificationList(context, yesterdayData),
                        ],
                        if (!isWeeklyEmpty) ...[
                          Text(
                            "This week",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.yellow, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 4),
                          buildNotificationList(context, weekData),
                        ],
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ).paddingOnly(left: 25, right: 0, top: 2),
        ),
      ),
    );
  }

  Widget buildNotificationList(BuildContext context, dynamic notificationData) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: notificationData.result.length,
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
              child: Image.network(notificationData.result[index].categoryLogo.toString()),
            ).paddingOnly(bottom: Get.height*0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    notificationData.result[index].message.toString(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  DateFormat('h:mm a')
                      .format(DateTime.parse(notificationData.result[index].createdAt.toString())),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppColors.whiteShade2,
                  ),
                ),
              ],
            ).paddingOnly(left: Get.width * 0.03),
          ],
        ).paddingOnly(bottom: Get.height*0.02);
      },
    );
  }
}
