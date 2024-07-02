import 'dart:convert';
import 'dart:io';
import 'package:apitest/api.dart';
import 'package:apitest/display_data_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanScreen extends StatefulWidget {
  final bool? navigationMenu;

  const QRCodeScanScreen({Key? key, this.navigationMenu}) : super(key: key);

  @override
  State<QRCodeScanScreen> createState() => _QRCodeScanScreenState();
}

class _QRCodeScanScreenState extends State<QRCodeScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  AnimationController? controllerr;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _buildQRCodeView(context),
    ));
  }

  Widget _buildQRCodeView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 280.0;

    return SafeArea(
      child: Stack(children: [
        Container(),
        Positioned.fill(
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
        ),
        const Center(
            child: Text(
          'Scan QR Code',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ))
      ]),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    ApiService apiService = ApiService();
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        controller.dispose();
      });

      if (result?.code != null) {
        
        var data = await apiService.fetchData(result?.code);
        var byte = base64.decode(data.profilePicture!);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayDataScreen(
                userData: data,
                profile: byte,
              ),
            ),(route) => false,);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
