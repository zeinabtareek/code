
import 'dart:async';

import 'package:arrows/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/shared_prefrences.dart';
import '../bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
 import '../sign_up/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final token=  CacheHelper.getDataToSharedPrefrence('token');

@override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5), () async{
          if(token !=null ){
            print(token);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>BottomNavBarScreen()));
          }else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          } });
  }


  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 200.r,
                child:  ClipRRect(
                  borderRadius:BorderRadius.circular(50),
                  child: Image.asset("assets/images/res.png"),

                )
            ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 100,
              child: RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  color: mainColor,
                  backgroundColor: mainColor.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}