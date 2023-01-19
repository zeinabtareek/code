import 'dart:io';
 import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/splash_screen/splash_screen.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'Translations/translations.dart';
import 'constants/colors.dart';

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}
class MyHttpoverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
  }
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global=  MyHttpoverrides();
  await CacheHelper.onInit();
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
   await Firebase.initializeApp();


  Locale? language;
  if (CacheHelper.getDataToSharedPrefrence("localeIsArabic") == null) {
    if (Get.deviceLocale == const Locale("ar_US")) {
      await CacheHelper.saveDataToSharedPrefrence("localeIsArabic", false);
    } else {
      await CacheHelper.saveDataToSharedPrefrence("localeIsArabic", true);
    }
    language = CacheHelper.getDataToSharedPrefrence("localeIsArabic")
        ? const Locale("ar")
        : const Locale("en");
  } else {
    language = CacheHelper.getDataToSharedPrefrence("localeIsArabic")
        ? const Locale("ar")
        : const Locale("en");
  }

  runApp(MyApp(
    language: language,
    isOpened: true,
  ));
}

class MyApp extends StatelessWidget {
  Locale? language;
  bool? isOpened;

  MyApp({this.language, this.isOpened});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(460, 847),
        builder: (BuildContext, Widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Languages(),
            locale: language,
            fallbackLocale: Locale('ar'),
            title: 'Balloonz',
            theme: ThemeData(
              fontFamily: 'Saudagar',
              scaffoldBackgroundColor: Colors.white,
              iconTheme: IconThemeData(color: kPrimaryColor, size: 33),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(color: mainColor),
                selectedLabelStyle: TextStyle(color: mainColor),
                selectedItemColor: kBottomNavBarSelectedIconColor,
                unselectedIconTheme: IconThemeData(
                  color: Colors.white,
                ),
                unselectedItemColor: mainColor,
                showSelectedLabels: true,
                 backgroundColor: mainColor,
               ),
            ),
            // home: LoginScreen(),
            home: SplashScreen(),
          );
        });
  }
}
