import 'package:arrows/helpers/shared_prefrences.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController  {
  final currentIndex = 2.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

   changeTabIndex(int index) {
    currentIndex.value = index;
    CacheHelper.getDataToSharedPrefrence("localeIsArabic");
    update();
  }

  @override
  Future<void> onInit() async {



     super.onInit();
  }
}
