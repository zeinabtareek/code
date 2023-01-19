import 'package:arrows/components/loading_spinner.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/sign_up/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/custom_button.dart';
import '../../../helpers/shared_prefrences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());

  final translateName = CacheHelper.getDataToSharedPrefrence("localeIsArabic");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child:  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        // Image.asset(
                        //   "assets/images/add-user.png",
                        SvgPicture.asset(
                          "assets/images/login.svg",
                          width: 200.w,
                          height: 400.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        GetBuilder<SignUpController>(
                          init: SignUpController(),
                          builder: (signUpController)=>  Directionality(
                            textDirection: translateName?TextDirection.rtl:TextDirection.ltr,
                            child:Container(
                              width: 348.w,
                              child:  TextFormField(
                                style: TextStyle(color: kPrimaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold ),
                                keyboardType: TextInputType.name,


                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please_enter_your_user_name'.tr;
                                  }
                                  return null;
                                },
                                onChanged: (newValue) async{
                                  signUpController.userNameTextEditingController =
                                      newValue;
                                  // CacheHelper.loginShared!.name=newValue;
                                },
                                decoration:

                                InputDecoration(
                                  hintText: "user_name".tr,
                                  filled: true,
                                  fillColor: Colors.white,

                                  isDense: true,
                                  // Added this
                                  contentPadding: EdgeInsets.all(20.w),
                                  hintStyle: TextStyle(color: mainColor, fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),


                      GetBuilder<SignUpController>(
                        init: SignUpController(),
                        builder: (signUpController)=>  Directionality(
                          textDirection: translateName?TextDirection.rtl:TextDirection.ltr,
                          child:Container(
                            width: 348.w,
                            child:  TextFormField(
                              style: TextStyle(color: kPrimaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold ),
                              keyboardType: TextInputType.name,


                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please_enter_your_password'.tr;
                                }
                                return null;
                              },
                              onChanged: (newValue) async{
                                signUpController.passwordTextEditingController =
                                    newValue;
                                print(signUpController.passwordTextEditingController);
                               },
                              decoration:

                              InputDecoration(
                                hintText: "password".tr,
                                filled: true,
                                fillColor: Colors.white,

                                isDense: true,
                                // Added this
                                contentPadding: EdgeInsets.all(20.w),
                                hintStyle: TextStyle(color: mainColor, fontSize: 16.sp),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                          Button(
                            text: "register_user".tr,
                            onPressed: () async {
                                showLoaderDialog(context);
                                 await signUpController.signIn()  ;
                             }, isFramed: false,
                           height: Get.height/20.h,
                           fontSize: 14,
                           size: 250,),
                      ],
                    ),
                  )),
            ),
          ),
    );
  }
}
