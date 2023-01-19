import 'package:arrows/modules/menu/model/menu_model.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/cart_card.dart';
import '../../../components/custom_card.dart';
import '../../menu/controllers/menu_controller.dart';

class ItemsScreen extends StatelessWidget {

  ItemsScreen({Key? key, }) : super(key: key);
  final controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=>controller.loading.value==false?ListView.builder(
        itemCount: controller.x.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
    itemBuilder: (_, index) =>
        CustomCardOrder(
          onTap: () {
            controller.addToCart(controller.x[index]);
          },
          createdAt: "${controller.x[index].createdAt}" ,
          name: "${controller.x[index].title}" ,
          updatedAt: "${controller.x[index].updatedAt}" ,
           price: "${controller.x[index].price}" ,
          isItemScreen:true,
          hasQuantity: "${controller.x[index].hasQuantity}" ,
          status: "${controller.x[index].active}" ,
          categoryName: "${controller.x[index].category}" ,
          readyByDefault: "${controller.x[index].readyByDefault}" ,
          image:"${controller.x[index].photo}" ,

        )):Center(child: CircularProgressIndicator(),),),



      ),
    );
  }
}
