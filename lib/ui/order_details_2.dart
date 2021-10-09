import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';
import 'package:screenshot_to_pdf/services/screenshot_saver.dart';
import 'dart:math';

class OrderDetails2 extends StatefulWidget {
  @override
  _OrderDetails2State createState() => _OrderDetails2State();
}

class _OrderDetails2State extends State<OrderDetails2> {
  String randomString = Random().nextInt(999).toString();
  ScreenshotController _controller = ScreenshotController();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Size screenSize;
  //Wrap your target widget with Screenshot widget to taregt the particular widget on the screen
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Specific part as PDF"),
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
                  content:
                      Text("PDF Saved Successfully in this location - $path")));
            } catch (e) {
              _key.currentState.showSnackBar(
                  SnackBar(content: Text("Something went wrong - $e")));
            }

            print(screen.toString());
          }),
      body: Container(
        height: screenSize.height,
        width: double.infinity,
        color: Colors.grey[400],
        child: Screenshot(
          controller: _controller,
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
                      "Tax",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "5%",
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
                      "Coupon Applied",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "FREECOUPON_23",
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
                      "Discount",
                      style: textStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "10%",
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
                      "\$00",
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

  TextStyle textStyle = TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold);
}
