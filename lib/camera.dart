import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qrapp/view.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: MobileScanner(
              // fit: BoxFit.contain,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              },
            ),
          ),
          TextButton(onPressed: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const Watch()));
    }, child: Text('View Page'))
        ],
      ),
    );
  }
}
