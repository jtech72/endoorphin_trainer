import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
PreferredSizeWidget myTabBar(TabController tabController, BuildContext context,) {
  return TabBar(
    controller: tabController,
    unselectedLabelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 11),
    labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 11,color: AppColors.yellow),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerHeight: 0,
    labelPadding: const EdgeInsets.all(2),
    automaticIndicatorColorAdjustment: true,
    indicator: BoxDecoration(
        color: AppColors.greyButton,
        borderRadius: BorderRadius.circular(10)
    ),
    indicatorWeight: 1,
    tabs: const [
      Tab(
        child: Text("Upcoming", style: TextStyle(fontSize: 11)),
      ),
      Tab(
        child: Text("Ongoing", style: TextStyle(fontSize: 11)),
      ),
      Tab(
        child: Text("Completed", style: TextStyle(fontSize: 11)),
      ),
      Tab(
        child: Text("Cancelled", style: TextStyle(fontSize: 11)),
      ),
    ],
  );
}
