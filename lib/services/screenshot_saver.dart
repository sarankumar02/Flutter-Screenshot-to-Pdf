import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:permission_handler/permission_handler.dart' as p;

Future savePdfFile(Uint8List screenShot, {String name}) async {
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Expanded(
          // change this line to this:
          child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
        );
      },
    ),
  );
  // File pdfFile = File('Your path + File name');
  const myPath = "/storage/emulated/0/Download";
  print("Directoryyyyyyyyy:${myPath}");
  File pdfFile = File("$myPath/$name.pdf");
  pdfFile.writeAsBytesSync(await pdf.save());
  return myPath;
}
