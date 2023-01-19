import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

import '../../../helpers/shared_prefrences.dart';
import 'package:http/http.dart' as http;
class PrintingServices{



  static getOrderDetailsImage(orderId)async{
  final token = CacheHelper.getDataToSharedPrefrence('token');
  final url='https://atom.crinklegypt.com/api/Order/createCashierPDF?order=$orderId';
  final response;
  try{

  response =  await http.get(Uri.parse(url),
  headers: {
  "Content-Type": "application/json",
  'Authorization': 'Bearer $token',
  },);


  if(response.statusCode==200){
  print('response.body');
  print(response.body);




final  dt = await http.get(Uri.parse(url));
  var pdfData = response.bodyBytes;
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
  Get.snackbar('Success', 'The Pdf is downloaded successfully ', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));

  // return  jsonDecode(response.body);
  }

  }catch (e){
  print(e);

}
  }
}