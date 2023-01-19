import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../helpers/shared_prefrences.dart';
import '../models/cart_model.dart';

class CartService {


  static Future<OrderHistoryModel?>getOrderHistory() async {
    final token = CacheHelper.getDataToSharedPrefrence('token');
    final url='https://atom.crinklegypt.com/api/Customer/OrdersHistory';
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
      print(OrderHistoryModel.fromJson(jsonDecode(response.body)));
      return OrderHistoryModel.fromJson(jsonDecode(response.body));
    }

  }catch (e){
      print(e);
    }
    }
}
