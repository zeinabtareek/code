import 'package:arrows/modules/search/search_model/SearchModel.dart';
import 'package:arrows/modules/search/servicews/search_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class SearchController extends GetxController {
  final services = SearchService();

  final loading = false.obs;
  SearchModel searchList2 = SearchModel();
  // final searchList = <SearchModel>[].obs;
   final pageNumber = 0.obs;
  // final search = ''.obs;
  TextEditingController searchText=TextEditingController();
  final RefreshController refreshController = RefreshController();

  @override
  onInit() {
    super.onInit();
    // search("b");
  }

  loadMore() async {
    if (searchList2 !=null) {
      pageNumber.value++;
      SearchModel? data =
          await services.searchCustomer(searchText.text);
          // await services.searchCustomer(search.value, );
      searchList2=data;
       print(searchList2);
      print("loading");
      print(pageNumber.value);
    } else {
      print("no subcategories");
    }
  }

  Future<void> searchData() async {
    loading.value = true;
    SearchModel? data =
        await services.searchCustomer("${searchText.text}");
        // await services.searchCustomer(search.value, );
    if (data != null) {
      searchList2=data;
       loading.value = false;
    } else if (data == null) {
      loading.value = false;
      // searchList2.clear();
    }
    // print(searchList2.phones!.length);
    loading.value = false;
  }
  // Future<void> searchData() async {
  //   loading.value = true;
  //   SearchModel? data =
  //       await services.searchCustomer(search.value, );
  //   if (data != null) {
  //     searchList.assignAll(await data.data ?? []);
  //      loading.value = false;
  //   } else if (data.data == null) {
  //     loading.value = false;
  //     searchList.clear();
  //   }
  //   print(searchList.length);
  //   loading.value = false;
  // }
}
