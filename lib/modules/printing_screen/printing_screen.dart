// import 'package:arrows/modules/printing_screen/services/printing_services.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:printing/printing.dart';
// import '../../components/share_with_media.dart';
// import '../../constants/styles.dart';
// import 'controller/printing_controller.dart';
// import 'package:pdf/widgets.dart' as pw;
// class PrintingScreen extends StatelessWidget {
//   String ?orderId;
//     PrintingScreen({Key? key,required this.orderId}) : super(key: key);
// final controller=Get.put(PrintingController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,),
//       body: Column(
//         children: [
//           Text('Order Details'),
//           Text('Order Id $orderId'),
//           GestureDetector(
//             onTap: () async {
//               // double pixelRatio = MediaQuery.of(context).devicePixelRatio;
//               // final imageFile =  await controller.screenshotController.captureFromWidget(
//               //     Image.network('https://avatars.mds.yandex.net/i?id=84dbd50839c3d640ebfc0de20994c30d-4473719-images-taas-consumers&n=27&h=480&w=480',height: 200.h,width: 200.w,),pixelRatio: pixelRatio) ;
//               // if(imageFile==null) {
//               //   Get.snackbar('Error', 'during downloading ', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
//               //   return ;
//               // }
//               // else{
//               //   await controller.getOrderDetailsPdf(imageFile);
//               //
//               // }
//               // PrintingServices.getOrderDetailsImage('57588');
//
//             },
//             child: Column(
//               children: [
//                 const Icon(FontAwesomeIcons.filePdf,
//                     size: 30, color: Colors.grey),
//                SizedBox(height: 20,),
//                 const Text('حفظ '),
//
//
//             GetBuilder<PrintingController>(
//                 init :PrintingController(),
//                 builder:(controller) =>    Container(
//                 width: Get.width/1.2.w,
//                 color: Colors.red,
//                 height: 120.h,
//                 child:  Stack(children: [
//     Positioned(
//     top:0,
//     left: 0,
//     // right: 0,
//     child:  IconButton(
//       onPressed: (){
//         controller.checkFun();
//       }
//       ,icon:  Icon(Icons.share ,
//         size: 30,
//         color: Colors.grey),),
//      ),
//                 AnimatedPositioned(
//                     // left: 100.w,
//                     right: 0,
//                     // top: 0,
//                     bottom:controller.pinPillPosition,
//                     duration: Duration(milliseconds: 700),
//                     curve: Curves.easeIn,
//                     child: ShareWithMedia()
//
//
//           ),
//
//     ],
//     ),
//     ),
//     ),
//           ]),
//           // Image.network('https://avatars.mds.yandex.net/i?id=84dbd50839c3d640ebfc0de20994c30d-4473719-images-taas-consumers&n=27&h=480&w=480',height: 200.h,width: 200.w,),
//           )],
//       ),
//     );
//   }
// }
