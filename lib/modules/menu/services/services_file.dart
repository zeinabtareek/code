import 'dart:convert';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/menu/model/menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/src/response.dart';
 import 'package:http/http.dart' as http;

import '../../bottom_nav_bar/screens/bottom_nav_bar_screen.dart';


//'
class MenuServices {


  static Future<MenuModel> getMenuData() async {
    final token = CacheHelper.getDataToSharedPrefrence('token');
      final url='https://atom.crinklegypt.com/api/Menu/list';
    final response;
try{
      response =  await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },);
    if(response.statusCode==200){
      print('response.body');
      print(response.body);
      print(MenuModel.fromJson(jsonDecode(response.body)));
      return MenuModel.fromJson(jsonDecode(response.body));
     }

   }
   catch(e){
  print('$e');
   }   return MenuModel();
   }





  static addToCart()async{
    final token = CacheHelper.getDataToSharedPrefrence('token');

    final url='https://atom.crinklegypt.com/api/Order/create';
    try{

      final response = await http.post(
          Uri.parse(url),
          body: {
            'order_total' : '122.0',
            'order_sub_total' :'100.0',
            'discount' : '22.0',
            'discountRate' : '11.0',
            'branch' : '2',
            'customer_id' : '18865',
            'order_type' : 'Delivery',
            'payment_type' : 'cash',
            'address' : '11',
            'items' :
            '[ { "item_id": "1", "item_name": "Branch Box", "quantity": "1", "price": "10.5", "Comment": "ffffff", "index":"45648784" }, { "item_id": "1", "item_name": "Branch Box", "quantity": "5", "price": "55.5", "Comment": "ffffff","index": "4324325" } ]' ,
            'service_fee' : '22',
            'service_cost' : '11.2',
          }, headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
          print('  success');
        // Get.offAll(BottomNavBarScreen());
        Get.snackbar('Done', 'an  order added successfully ',
            snackPosition: SnackPosition.TOP,
            backgroundColor: mainColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
             colorText: Colors.white,);
        print(data);

      }else {
        print('failed');
        // Get.back();
        Get.snackbar('failed', ' ',
            snackPosition: SnackPosition.TOP,
            backgroundColor: mainColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
            colorText: mainColor);
      }
    }catch(e){
      print(e.toString());
      Get.back();
    }
  }
}
