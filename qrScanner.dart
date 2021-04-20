import 'package:Tobi/Pages/IotMap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// ignore: must_be_immutable
class QRScanner extends StatefulWidget {
  String uid;
  QRScanner(this.uid);
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Color bgColor = Colors.grey[900];

  String qRCodeData = "";

  bool pairBox = false;
  bool scanBox = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String qRCodeDataResponse;

    try {
      qRCodeDataResponse = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
    } on PlatformException {
      qRCodeDataResponse = 'failed';
    }

    if (!mounted) return;
    setState(() {
      qRCodeData = qRCodeDataResponse;
    });
  }

  CollectionReference users =
      FirebaseFirestore.instance.collection('gps_devices');

  Future<void> addDevice(String did) {
    return users
        .doc(widget.uid)
        .set({'deviceId': did})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Pair"),
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
        ),
        body: Center(
          child: Column(
            children: [
              Visibility(
                maintainAnimation: true,
                maintainSize: false,
                maintainState: true,
                visible: scanBox,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // elevation: 5,
                    // borderRadius: BorderRadius.circular(20),
                    // color: Color.fromARGB(255, 20, 20, 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "Please Scan QR code to pair new GPS Collar with your smart phone.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                          child: MaterialButton(
                            child: Text(
                              "Scan now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              scanQR();
                              if (qRCodeData != "" || qRCodeData != "-1") {
                                setState(() {
                                  pairBox = true;
                                  scanBox = false;
                                });
                              } else {
                                setState(() {
                                  pairBox = false;
                                  scanBox = true;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                maintainAnimation: true,
                maintainSize: false,
                maintainState: true,
                visible: pairBox,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Color.fromARGB(255, 20, 20, 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "Device Id : $qRCodeData",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                          child: MaterialButton(
                            child: Text(
                              "Pair device",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              if (qRCodeData != "" &&
                                  qRCodeData != "-1" &&
                                  qRCodeData.length == 6) {
                                String deviceId = qRCodeData;
                                addDevice(deviceId);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => IotMap(deviceId)));
                              } else {
                                pairBox = false;
                                scanBox = true;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                          child: MaterialButton(
                            child: Text(
                              "Scan again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              scanQR();
                              if (qRCodeData != "" || qRCodeData != "-1") {
                                setState(() {
                                  pairBox = true;
                                  scanBox = false;
                                });
                              } else {
                                setState(() {
                                  pairBox = false;
                                  scanBox = true;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
