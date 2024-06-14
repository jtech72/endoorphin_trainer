import 'dart:async';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/app_pages.dart';
import 'package:endoorphin_trainer/utils/app_strings.dart';
import 'package:endoorphin_trainer/utils/app_themes.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_links2/uni_links.dart';
import 'firebase_options.dart';
void main() async {
  try {
    await configure();
  } catch (e, stackTrace) {
    log('Error initializing Firebase: $e\n$stackTrace');
  }
  await initUniLinks();
  GetStorage.init();
  runApp(const EndoorphinTrainer());
}

@pragma("vm:entry-point")
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("FIREBASE BG NOTIFICATION => ${message.notification.toString()}");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> configure() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GetStorage.init();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

StreamSubscription? sub;
Future<void> initUniLinks() async {
  try {
    Uri? initialUri = await getInitialUri();
    if (initialUri != null) {
      print('Initial URI: ${initialUri.toString()}');
      // Handle the deep link here
    }
  } on Exception catch (e) {
    // Handle exception
    print(e.toString());
  }

  sub = uriLinkStream.listen((Uri? uri) {
    if (uri != null) {
      print('Received URI: ${uri.toString()}');
      // Handle the deep link here
    }
  }, onError: (err) {
    // Handle error
    print(err.toString());
  });
}

class EndoorphinTrainer extends StatelessWidget {
  const EndoorphinTrainer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh"),

        Locale('en', ''),
        Locale('zh', ''),
        Locale('he', ''),
        Locale('es', ''),
        Locale('ru', ''),
        Locale('ko', ''),
        Locale('hi', ''),
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppThemes.appTheme,
    );
  }
}


