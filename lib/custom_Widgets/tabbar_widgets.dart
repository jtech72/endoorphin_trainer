import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

myTabBar (TabController tabController ,BuildContext context){
  return PreferredSize(preferredSize: const Size.fromHeight(30),
      child: TabBar(
        controller: tabController,
        unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 1,
        tabs:  [
          const Text("Upcoming",style: TextStyle(fontSize: 10),).paddingOnly(bottom: 10),
          const Text("Ongoing",style: TextStyle(fontSize: 10)).paddingOnly(bottom: 10),
          const Text("Completed",style: TextStyle(fontSize: 10)).paddingOnly(bottom: 10),
          const Text("Canceled",style: TextStyle(fontSize: 10)).paddingOnly(bottom: 10),
        ],

      ));

}