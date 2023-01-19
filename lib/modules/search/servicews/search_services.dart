import 'dart:convert';
import 'package:arrows/modules/search/search_model/SearchModel.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/shared_prefrences.dart';

class SearchService {

    Future<SearchModel> searchCustomer(String phone) async {
     final url='https://atom.crinklegypt.com/api/Customer/getCustomer';
     final token = CacheHelper.getDataToSharedPrefrence('token');

     final response;
    try{
      response =  await http.post(Uri.parse(url),
        body:  {
          'phone' : '$phone',
        },
        headers: {
          // "content-type": "application/json",
          'Authorization': 'Bearer $token',
        },);
      if(response.statusCode==200){
        print('response.body');
        print(response.body);
        print(SearchModel.fromJson(jsonDecode(response.body)));
        return SearchModel.fromJson(jsonDecode(response.body));
      }

    }
    catch(e){
      print('$e');
    }   return SearchModel();
  }

}
//
