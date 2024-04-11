import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/splash_binding.dart';
import '../pages/splash_ui.dart';
import 'app_routes.dart';

class AppPages {
  static  const initialRoute = AppRoutes.splash;
  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashUI(),
        binding: SplashBinding()
    ),
  ];
}
