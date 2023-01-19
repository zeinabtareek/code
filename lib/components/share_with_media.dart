 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../constants/styles.dart';
import '../modules/printing_screen/controller/printing_controller.dart';


class ShareWithMedia extends StatelessWidget {
  ShareWithMedia({
    Key? key,required this.orderID
  }) : super(key: key);
  String orderID;
  final controller = Get.put(PrintingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),

                blurRadius: 10,
                offset: Offset.zero)
          ]),
      child: GetBuilder<PrintingController>(
        init: PrintingController(),
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                controller.checkFun();
                var imageFile = await controller.screenshotController
                    .captureFromWidget(buildImageWidget(orderID));
                if (imageFile == null) {
                  Get.snackbar('Error', 'during downloading ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2));
                  return;
                } else {
                  await controller.saveImage(imageFile);
                  Get.snackbar(
                      'Success', 'The image is downloaded successfully ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2));
                }
              },
              child: Column(children: [
                const Icon(FontAwesomeIcons.download,
                    size: 30, color: Colors.grey),
                SizedBox(height: 20.h,),
                const Text('الحفظ في المعرض'),
              ]),
            ),
            SizedBox(width: 10.h,),
            GestureDetector(
              onTap: () async {
                double pixelRatio = MediaQuery.of(context).devicePixelRatio;
                final imageFile = await controller.screenshotController
                    .captureFromWidget(buildImageWidget(orderID),
                    pixelRatio: pixelRatio);
                await controller.saveAndShare(imageFile);
              },
              child: Column(
                children: [
                  const Icon(FontAwesomeIcons.share,
                      size: 30, color: Colors.grey),
                  SizedBox(height: 20.h,),

                  const Text('مشاركه'),
                ],
              ),
            ),

            SizedBox(width: 20.h,),
            SizedBox(width: 20.h,),

            GestureDetector(
              onTap: () async {
                double pixelRatio = MediaQuery.of(context).devicePixelRatio;
                final imageFile =  await controller.screenshotController.captureFromWidget( buildImageWidget(orderID),pixelRatio: pixelRatio) ;
                if(imageFile==null) {
                  Get.snackbar('Error', 'during downloading ', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
                  return ;
                }
                else{
                  await controller.getOrderDetailsPdf(orderID);
                  // await controller.getPdf(imageFile);
                }
              },
              child: Column(
                children: [
                  const Icon(FontAwesomeIcons.filePdf,
                      size: 30, color: Colors.grey),
                  SizedBox(height: 20.h,),

                  const Text('حفظ '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 Widget buildImageWidget(orderID) {
   final controller = Get.put(PrintingController());

   return Screenshot(
     controller: controller.screenshotController,
     child:   Container(
       height: 80.h,
       width: 200.w,
       padding: EdgeInsets.only(top: 30.0.h),
       decoration: const BoxDecoration(
         color: Colors.white,
       ),
       child: controller.getOrderDetailsPdf(orderID)


     ),
   );
 }