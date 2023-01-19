
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';
import 'custom_button.dart';
  import 'package:octo_image/src/image/image.dart';
 import 'package:octo_image/src/placeholders.dart';
 import 'package:flutter_blurhash/src/blurhash_widget.dart';
class CustomCardOrder extends StatelessWidget {
  const CustomCardOrder(
      {Key? key,
        this.onTap,
        this.status,

         this.updatedAt,
        this.createdAt,
        this.name,
        this.image,
        this.price,
        this.categoryName,
        this.hasQuantity,
        this.isItemScreen,
         this.readyByDefault,
 })
      : super(key: key);
  final String? name;
  final String? price;

  final String? createdAt;
  final String? updatedAt;
   final String? image;
  final String? status;
  final String? readyByDefault;
  final String? categoryName;
  final String? hasQuantity;
  final bool? isItemScreen;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:   EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side:   BorderSide(color: mainColor, width: 1)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: Get.height * 0.05,
            decoration:   BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name.toString(),
                    style: TextStyle(
                        color: Colors.white, fontSize: 16.sp
                    )),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const SizedBox(width: 25),
              Expanded(
                child: Text(
                  price.toString(),
                  style: TextStyle(
    color: Colors.black, fontSize: 16.sp),
                ),
              ),  const SizedBox(width: 25),
              Expanded(
                child: Text(
                  "   Price",
                  style: TextStyle( color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 25),

              Expanded(
                child: Text(
                  status??'',
                  style: TextStyle(
                      color: Colors.black, fontSize: 16.sp
                  ),
                ),
              ),  const SizedBox(width: 25),
              Expanded(
                child: Text(
                  "  status",
                  style: TextStyle( color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 25),

              Expanded(
                child: Text(
                  createdAt??'',
                  style: TextStyle( color: Colors.black, fontSize: 16.sp),
                ),
              ), const SizedBox(width: 25),
              Expanded(
                child: Text('created At',
                  style: TextStyle( color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 25),

              Expanded(
                child: Text(
                  updatedAt??'',
                  style: TextStyle( color: Colors.black, fontSize: 16.sp),
                ),
              ),const SizedBox(width: 25),
              Expanded(
                child: Text(
                  "updated At ",
                  style: TextStyle( color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //   child:   Image.network('$image',fit: BoxFit.contain,),...
              //   height: 100,
              //   width: 200,
              // ),

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
                      '$image',
                    ),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        fit: BoxFit.fill),
                    errorBuilder: (context, url, error) {
                      return BlurHash(
                          hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
                    },
                    fit: BoxFit.cover,
                  )),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          categoryName??'',
                          style: TextStyle( color: mainColor, fontSize: 16.sp),
                        ),
                        Text(
                          "Category  ",
                          style: TextStyle( color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
          isItemScreen==true?Button(
            text: "Add To Cart".tr,
            onPressed:onTap, isFramed: false,
            height: Get.height/20.h,
            fontSize: 14,
            size: 250,):SizedBox(),


        ],
      ),
    );
  }
}
