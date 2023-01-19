



import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../services/cart_service.dart';

class CartController extends GetxController {

  OrderHistoryModel ?orderHistoryModel=OrderHistoryModel();
final  loading=false.obs;

  List productsList=[].obs;

  onInit() async {
    productsList;
    getOrderHistory();

  }


  getOrderHistory()async{
    loading.value=true;
    orderHistoryModel =await CartService.getOrderHistory();
     loading.value=false;
      orderHistoryModel!.orders!.forEach((element) {
        if(productsList.length<20)productsList.add(element);
      });


print(productsList.length);


    update();
  }

}

