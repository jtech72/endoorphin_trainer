

import 'package:flutter/material.dart';

import '../utils/exports.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: SizedBox(
            height: 55,
            width: 222,
            child: Image.asset(ImagesPaths.logoimg)),
      ),
    );
  }
}
