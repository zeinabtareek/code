import 'package:arrows/constants/colors.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/search/controller/search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String replaceFarsiNumber(String input) {
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

      for (int i = 0; i < farsi.length; i++) {
        input = input.replaceAll(farsi[i], english[i]);
      }
      return input;
    }

    final controller = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 1,
        centerTitle: true,
        title: Text(
          'search'.tr,
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              onChanged: (v) {
                // controller.search.value = v;
                controller.searchData();
              },
              controller: controller.searchText,
              decoration: InputDecoration(
                label: Text(' '.tr),
              ),
              // keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter something to search';
                }
                return null;
              },
            ),
            Obx(() => controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : controller.searchList2.address!=null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        child: SmartRefresher(
                          controller: controller.refreshController,
                          enablePullUp: true,
                          enablePullDown: false,
                          onLoading: () async {
                            await controller.loadMore();
                          },
                          child:
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     physics: BouncingScrollPhysics(),
                          //     itemCount: controller.searchList.length,
                          //     itemBuilder: (context, index) {
                          //       final translateName =
                          //           CacheHelper.getDataToSharedPrefrence(
                          //               "localeIsArabic"); //
                          //       return InkWell(
                          //         onTap: ()   {
                          //         // Get.to(()=>ProductDetails2());
                          //         //   Get.to(ProductDetails2(data: controller.searchList[index]));
                          //         },
                          //         child:
                                  Card(
                                      elevation: 5,
                                      color: mainColor,
                                      shadowColor: mainColor,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: mainColor, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                        //   ClipRRect(
                                        //   borderRadius: BorderRadius.only(
                                        //       topLeft: Radius.circular(15),
                                        //       bottomLeft:
                                        //       Radius.circular(15)),
                                        //   child: CachedNetworkImage(
                                        //       height: 120.h,
                                        //       width: 150.w,
                                        //       imageUrl: 'https://www.pngitem.com/pimgs/m/404-4042686_my-profile-person-icon-png-free-transparent-png.png'??
                                        //           "",
                                        //       fit: BoxFit.contain,
                                        //       errorWidget: (context, url,
                                        //           error) =>
                                        //           Center(
                                        //             child: SizedBox(
                                        //               height: 30,
                                        //               width: 30,
                                        //               child:
                                        //               CircularProgressIndicator(
                                        //                 color: kPrimaryColor
                                        //                     .withOpacity(0.6),
                                        //               ),
                                        //             ),
                                        //           )),
                                        // ),
                                           Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.searchList2.basicInfo!.name ??
                                                      "",
                                                  style: TextStyle(
                                                    fontSize:  22.sp,
                                                    color:  Colors.black,
                                                    decoration:  TextDecoration
                                                            .lineThrough,
                                                    fontWeight: FontWeight.w600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  height: 80.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:  BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      30.r))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${replaceFarsiNumber(controller.searchList2.basicInfo!.internalNotes.toString() ?? "")} ",
                                                        style: TextStyle(
                                                            fontSize: 25.sp),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Text(
                                                        'internalNotes',
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                Container(
                                                  height: 80.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:  BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                  30.r))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${replaceFarsiNumber(controller.searchList2.basicInfo!.notes.toString() ?? "")} ",
                                                        style: TextStyle(
                                                            fontSize: 25.sp),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Text(
                                                        'Notes',
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                Container(
                                                  // height:.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:  BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(
                                                              30.r))),
                                                  child:ListView.builder(
                                                    itemCount: controller.searchList2.address!.length,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                    (build ,index){

                                                    return  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "${controller.searchList2.address![index].address.toString() ?? ""} ",
                                                          style: TextStyle(
                                                              fontSize: 25.sp),
                                                        ),
                                                        SizedBox(width: 20.w),
                                                        Text(
                                                          '${index+1} :address',
                                                          style: TextStyle(
                                                              color:
                                                              kPrimaryColor,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 20.sp),
                                                        ),
                                                        SizedBox(width: 20.w),
                                                      ],
                                                    );
                                                    })
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      )),
                              //   );
                              // }),
                        )):SizedBox())

          ],
        ),
      ),
    );
   }
}

