import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import '../services/printing_services.dart';
import 'package:pdf/widgets.dart' as pw;
class PrintingController extends GetxController{
final services=PrintingServices();
static double PIN_INVISIBLE_POSITION = -200;
static double PIN_VISIBLE_POSITION = 12;
final screenshotController = ScreenshotController();
double? pinPillPosition = PIN_INVISIBLE_POSITION;
@override
  onInit(){
  // PrintingServices.getOrderDetailsImage('57588');
  // getOrderDetailsPdf('57588');
  }
  getOrderDetailsPdf(orderId){
    var pdf =PrintingServices.getOrderDetailsImage(orderId);
    print(pdf);
  }


final check = false.obs;
Uint8List? bytes;

checkFun() {
  check.value = !check.value;
  isChecked(check);
  print(check.value);
  update();
}

isChecked(check) {
  try {
    if (check != null) {
      pinPillPosition =
      check != true ? PIN_INVISIBLE_POSITION : PIN_VISIBLE_POSITION;
      update();
    } else {
      print('error');
    }
  } catch (e) {
    throw Exception();
  }
}

Future  saveImage(Uint8List x) async {
  bytes = x;
  await [Permission.storage].request();
  const name = 'Esnad ScreenShots';
  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '_')
      .replaceAll(':', '_');

  final result = await ImageGallerySaver.saveImage(
    x,
    name: name,
  );
  // return result['filePath'];
} //save in gallery

Future saveAndShare(Uint8List x) async {
  bytes = x;
  final directory = await getApplicationDocumentsDirectory();
  final image = File('${directory.path}/f.png');
  image.writeAsBytesSync(bytes!);
  final text = 'Shared From Esnad App';
  await Share.shareFiles([image.path], text: text);
} //save in mobile

Future getPdf(Uint8List screenShot) async {
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Expanded(
          child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
        );
      },
    ),
  );

}
}