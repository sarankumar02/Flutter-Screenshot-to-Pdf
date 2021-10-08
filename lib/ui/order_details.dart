import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';
import 'package:screenshot_to_pdf/services/screenshot_saver.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  ScreenshotController _controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _controller,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // _imageFile = null;
          Uint8List screen = await _controller.capture();
          savePdfFile(screen);
          print(screen.toString());
          // screenshotController.capture().then((Uint8List image) async {
          //   //print("Capture Done");
          //   // print(image.toString());
          //   setState(() {
          //     _imageFile = image;
          //   });
          //   print(image.runtimeType);
          //   // final result =
          //   //     await ImageGallerySaver.save(image); // Save image to gallery,  Needs plugin  https://pub.dev/packages/image_gallery_saver
          //   print("File Saved to Gallery");
          // }).catchError((onError) {
          //   print("Error");
          //   print(onError);
          // });
        }),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [Text("Order Id"), Text("93849449494")],
              ),
              Row(
                children: [Text("Order Id"), Text("93849449494")],
              ),
              Row(
                children: [Text("Order Id"), Text("93849449494")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
