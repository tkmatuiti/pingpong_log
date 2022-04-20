import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQrCodeScreen extends StatelessWidget {
  final String _qrCodeData;

  const DisplayQrCodeScreen(this._qrCodeData);

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text("読み込んで下さい"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        color: Colors.white,
        child: Center(
          child: QrImage(
            version: 10,
            data: _qrCodeData,
            size: 0.2 * bodyHeight,
          ),
        ),
      ),
    );
  }

  @override
  String get name => "/qr";
}
