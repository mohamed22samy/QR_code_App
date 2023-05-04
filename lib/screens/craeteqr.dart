import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQRCode extends StatefulWidget {
  @override
  State<CreateQRCode> createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  String qrstr = "Add Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Creating QR Code'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BarcodeWidget(
              data: qrstr,
              barcode: Barcode.qrCode(),
              color: Colors.black,
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    qrstr = value;
                  });
                },
                decoration: const InputDecoration(
                    hintText: "Enter Data Here ...",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ));
  }
}
