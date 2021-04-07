//import 'package:flutter/material.dart';
//
//import 'package:qr/qr.dart';
//
/////保留してます。使うか？
///// QRコードを表示するための画面
//class DisplayQrCodeScreen extends StatelessWidget {
//  final String _qrCodeData;
//
//  const DisplayQrCodeScreen(this._qrCodeData);
//
//  @override
//  Widget build(BuildContext context) {
//    final bodyHeight = MediaQuery.of(context).size.height -
//        MediaQuery.of(context).viewInsets.bottom;
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(Strings.of(context).qrCode),
//        backgroundColor: Colors.black,
//      ),
//      backgroundColor: Colors.black,
//      body: Container(
//        color: Colors.white,
//        child: Center(
//          child: QrImage(
//            version: 10,
//            data: _qrCodeData,
//            size: 0.2 * bodyHeight,
//          ),
//        ),
//      ),
//    );
//  }
//
//  @override
//  String get name => "/qr";
//}
