import 'dart:convert';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../bottom_nav_bar/screens/bottom_nav_bar_screen.dart';

class AuthServices {

  static signInUser({String ?name, String? password}) async {
      try{

        final response = await http.post(
            Uri.parse('https://atom.crinklegypt.com/api/login'),
            body: {
              'email' : '$name',
              'password' : '$password'
            }
        );
        if(response.statusCode == 200){
          var data = jsonDecode(response.body.toString());
          print(data['token']);
         await CacheHelper.saveDataToSharedPrefrence('token', data['token']);
          print('Login successfully');
          Get.offAll(BottomNavBarScreen());

        }else {
          print('failed');
          Get.back();
        }
      }catch(e){
        print(e.toString());
        Get.back();
      }

  }
}
