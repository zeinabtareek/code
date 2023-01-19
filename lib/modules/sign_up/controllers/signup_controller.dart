
import 'package:arrows/modules/sign_up/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';

class SignUpController extends GetxController {
  //

  String? userNameTextEditingController;
  String? passwordTextEditingController;

  String? fullPhoneNumber;
  final pin=''.obs;
  CartController cartController=Get.put(CartController());
   final formKey = GlobalKey<FormState>();

   String? verification;
  var userId;

    signIn() async {

      await AuthServices.signInUser( name: userNameTextEditingController,password:passwordTextEditingController);

   }


 }

