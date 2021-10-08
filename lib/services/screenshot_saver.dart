import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:permission_handler/permission_handler.dart' as p;

Future savePdfFile(Uint8List pdf) async {
  p.PermissionStatus status = await p.PermissionHandler()
      .checkPermissionStatus(p.PermissionGroup.storage);
  // if (status == p.PermissionStatus.unknown) {
  //   print("Unknown da");
  // }
  // print("service status $status");
  if (status != p.PermissionStatus.granted) {
    print("CHECKING PERMISSION");

    await p.PermissionHandler().requestPermissions([p.PermissionGroup.storage]);
    print("GETTING PERMISSION");
  }
  // final dir = await getExternalStorageDirectory();
  final myPath = "/storage/emulated/0/Download";
  print("Directoryyyyyyyyy:${myPath}");
  final String path = "${myPath}/example1.pdf";
  final buffer = pdf.buffer;

  final file = File(path);
  await file
      .writeAsBytes(buffer.asUint8List(pdf.offsetInBytes, pdf.lengthInBytes));
  print("success");
  // Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => PgfViewerPage(path: path)));
}
