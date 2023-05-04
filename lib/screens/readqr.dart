import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannQRCode extends StatefulWidget {
  @override
  State<ScannQRCode> createState() => _ScannQRCodeState();
}

class _ScannQRCodeState extends State<ScannQRCode> {
  var qrstr = "let's Scan it";
  var hight, width;
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scanning QR Code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  qrstr,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.blue,
                  onPressed: () {
                    scanQr();
                  },
                  textColor: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Scann Qr",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: hight,
              )
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
          .then(
        (value) {
          setState(() {
            qrstr = value;
          });
        },
      );
    } catch (e) {
      setState(() {
        qrstr = "unable to read this ";
      });
    }
  }
}
