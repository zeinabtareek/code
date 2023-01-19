
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/share_with_media.dart';
import '../../printing_screen/controller/printing_controller.dart';
import '../../printing_screen/printing_screen.dart';
class CartScreen extends StatelessWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerr=Get.put(CartController());
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(()=>controllerr.loading.value==false?
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:  controllerr.productsList.length,
                  itemBuilder: (build ,index)=>
                      Padding(
                          padding:
                          const EdgeInsets.only(bottom: 18.0),
                          child: Directionality(
                              textDirection:   TextDirection.rtl,
                              child:  Card(
                                  elevation:3,
                                  // color: mainColor,
                                  shadowColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: mainColor, width: 3),
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Container(
                                                        height:150.h,
                                                        // child: Image.network('${controller.orderHistoryModel.orders[index].}',fit: BoxFit.contain,),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              decoration:BoxDecoration(
                                                                border: Border.all(color: Colors.grey.shade400,width: 2),
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                              margin: EdgeInsets.only(bottom: 20.h,left: 10.w,right: 10.w),
                                                              padding: EdgeInsets.all( 10.h),
                                                              child:   Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "التاريخ :".tr,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize:
                                                                        18.sp),
                                                                  ),
                                                                  Text('${controllerr.productsList[index].id.toString()}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        fontSize:
                                                                        16.sp),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                 Text("عدد القطع :",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.black,
                                                                      fontSize:
                                                                      20.sp,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ), SizedBox(width: 20,),
                                                                Text("${controllerr.productsList[index].status}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                      20.sp,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                 Text(" الحاله :",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.black,
                                                                      fontSize:
                                                                      20.sp,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ), SizedBox(width: 20,),
                                                                Text("مكتمل",
                                                                  style: TextStyle(
                                                                      color: mainColor,
                                                                      fontSize:
                                                                      20.sp,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            GetBuilder<PrintingController>(
                                                              init :PrintingController(),
                                                              builder:(controller) =>    Container(
                                                                width: Get.width/1.2.w,
                                                                // color: Colors.red,
                                                                height: 130.h,
                                                                child:  Stack(children: [
                                                                  Positioned(
                                                                    top:0,
                                                                    left: 0,
                                                                    // right: 0,
                                                                    child:  IconButton(
                                                                      onPressed: (){
                                                                        controller.checkFun();
                                                                      }
                                                                      ,icon:  Icon(Icons.share ,
                                                                        size: 30,
                                                                        color: Colors.grey),),
                                                                  ),
                                                                  AnimatedPositioned(
                                                                    // left: 100.w,
                                                                      right: 0,
                                                                      // top: 0,
                                                                      bottom:controller.pinPillPosition,
                                                                      duration: Duration(milliseconds: 700),
                                                                      curve: Curves.easeIn,
                                                                      child: ShareWithMedia(orderID: '${controllerr.productsList[index].id}',)


                                                                  ),

                                                                ],
                                                                ),//57589
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                // ),
                                // onTap: (){
                                //   Get.to(PrintingScreen(orderId: '${controller.productsList[index].id}',));
                                // },
                              )))
              )
              :Center(child: CircularProgressIndicator(),)
              )
              /**********************************************the End********************************************************/
            ],
          ),
        ),
      ),
    );
  }
}