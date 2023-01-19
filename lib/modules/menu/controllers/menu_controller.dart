import 'package:get/get.dart';

import '../model/menu_model.dart';
import '../services/services_file.dart';

class MenuController extends GetxController{

  MenuModel  menuModel2   =MenuModel();
List x=<Items>[].obs;
final loading=false.obs;
 onInit() async {
   getMenuData();
 menuModel2=await MenuServices.getMenuData() ;
print('******${menuModel2.category}');
   }
  getMenuData()async {
   loading.value=true;
    menuModel2= await MenuServices.getMenuData() ;
   loading.value=false;
    menuModel2.items!.forEach((element) {
     x.add(element);
    });

}
  addToCart(Items items){
   MenuServices.addToCart();

  }
}