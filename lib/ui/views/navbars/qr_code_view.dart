import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCodeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        backgroundColor: colorRed,
        title: Container(
          padding: const EdgeInsets.only(),
          child: const Text(
            'Kode QR',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: Stack(
        children: [
          _buildQrView(context),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 60,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: colorWhite,
              ),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () {},
                  child: const Center(
                    child: Icon(Icons.image_outlined, size: 30,),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 80,
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: colorWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 15),
                    child: MaterialButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          if (snapshot.data == false) {
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.flash_off,
                                    size: 25,
                                  ),
                                  Text("OFF")
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.flash_on,
                                    size: 25,
                                  ),
                                  Text("ON")
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 15),
                    child: MaterialButton(
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getCameraInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              if (describeEnum(snapshot) == 'back') {
                                return Container(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_rear,
                                        size: 25,
                                      ),
                                      Text("Back")
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_front,
                                        size: 25,
                                      ),
                                      Text("Front")
                                    ],
                                  ),
                                );
                              }
                            } else {
                              return Text('loading');
                            }
                          },
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 800 ||
        MediaQuery.of(context).size.height < 800)
        ? 270.0
        : 540.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: colorRed,
        borderRadius: 5,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: scanArea,
        cutOutBottomOffset: 20,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        inputQrData(result!);
        controller.dispose();
      });
    });
  }

  void inputQrData(Barcode result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (result.code!.isNotEmpty) {
      String? jsonData = await result.code;
      //print(jsonData);
      await prefs.setString('datadevice', jsonData!);
      print('[result QR] $jsonData');
      // final data = json.decode(jsonData);
      // print(data);
      // device = Device.fromMap(data);
      // print('ini value nya');
      // print(device);
      controller?.stopCamera();
      controller?.dispose();
    }
  }

}