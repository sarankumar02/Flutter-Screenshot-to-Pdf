import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';
import 'package:screenshot_to_pdf/services/screenshot_saver.dart';
import 'dart:math';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String randomString = Random().nextInt(999).toString();
  ScreenshotController _controller = ScreenshotController();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Size screenSize;
  //Wrap you scaffold with Screenshot widget to screenshot the whole screen
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Screenshot(
      controller: _controller,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("Screenshot To PDF"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.camera_alt_rounded),
            tooltip: "Save the screenshot as PDF",
            onPressed: () async {
              // _imageFile = null;
              Uint8List screen = await _controller.capture();
              try {
                String path =
                    await savePdfFile(screen, name: "Order_$randomString");
                _key.currentState.showSnackBar(SnackBar(
                    content: Text(
                        "PDF Saved Successfully in this location - $path")));
              } catch (e) {
                _key.currentState.showSnackBar(
                    SnackBar(content: Text("Something went wrong - $e")));
              }

              print(screen.toString());
            }),
        body: Container(
          height: screenSize.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Order Id",
                      style: textStyle.copyWith(fontSize: 22.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "93849449494",
                      style: textStyle.copyWith(fontSize: 22.6),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Subtotal",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "\$999",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Charges",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "\$40",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Grand Total",
                      style: textStyle.copyWith(fontSize: 22.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "\$1030",
                      style: textStyle.copyWith(fontSize: 22.6),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
