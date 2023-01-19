import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_card.dart';
import '../../../constants/colors.dart';
import '../../sub_products_screen/screen/sub_pro_screen.dart';
import '../controllers/menu_controller.dart';
import 'package:octo_image/src/image/image.dart';
import 'package:octo_image/src/placeholders.dart';
import 'package:flutter_blurhash/src/blurhash_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text("MMenu List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: controller.menuModel2.category!.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => GetBuilder<MenuController>(
            init: MenuController(),
            builder: (controller) => Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: mainColor, width: 1)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            controller.menuModel2.category![index].title
                                .toString(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          controller.menuModel2.category![index].id.toString(),
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          " id",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Container(
                      //   child: Image.network(
                      //     '${controller.menuModel2.category![index].photo}',
                      //     fit: BoxFit.contain,
                      //   ),
                      //   height: 100,
                      //   width: 300,
                      // ),
                      SizedBox(height: 10,),
                      Container(
                          clipBehavior: Clip.antiAlias,
                          width: Get.width/3.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: mainColor, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                '${controller.menuModel2.category![index].photo}',
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                fit: BoxFit.fill),
                            errorBuilder: (context, url, error) {
                              return BlurHash(
                                  hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
                            },
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
