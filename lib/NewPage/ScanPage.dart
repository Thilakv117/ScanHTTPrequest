import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_two/MainPage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

HomePage page = new HomePage();

class ScanPage extends StatefulWidget {
  ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? qrCodeValue;
  void overViewController(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((ScanData) {
      setState(() {
        qrCodeValue = ScanData.code;
        controller.pauseCamera();
        print(qrCodeValue.runtimeType);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: overViewController,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
              ),
            ),
          ),
          Expanded(
            child: Text('${qrCodeValue}'),
          ),
          ElevatedButton(
            onPressed: () {
              submitData();
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }

  submitData() async {
    const url = "https://microtechbackend.onrender.com/update_stage/";
    final uri = Uri.parse(url);
    final body = qrCodeValue;
    final response = await http.post(uri, body: body);
    print(json.decode(response.body));
  }
}
