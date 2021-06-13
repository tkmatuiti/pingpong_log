import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'package:tt_diary/screens/my_home_page.dart';

String randomString(int length) {
  const _randomChars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const _charsLength = _randomChars.length;

  final rand = new Random();
  final codeUnits = new List.generate(
    length,
    (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },
  );
  return new String.fromCharCodes(codeUnits);
}

var _roomNumber = randomString(10);

final copy = SnackBar(
  content: Text('Copy!'),
);

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('参加者を待っています！'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('ルームQRコード'),
              QrImage(
                data: _roomNumber,
                version: QrVersions.auto,
                size: 200.0,
              ),
              // 3.押したときの背景が黒色のボタン
              ElevatedButton(
                onPressed: () {
                  SnackBar(
                    content: Text('Copy!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('copy!'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'copyyyy!!!',
                      onPressed: () {},
                    ),
                  ));
                },
                child: Text(
                  "3.onPressed Color Button",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black, //押したときの色！！
                ),
              ),
              // ElevatedButton(
              //   child: Text(randomString(10)),
              //   onPressed: () {
              //     Clipboard.setData(ClipboardData(text: _roomNumber));
              //     SnackBar(
              //       content: Text('Copy!'),
              //     );
              //     Scaffold.of(context).ScaffoldMessenger.showSnackBar(copy);
              //   },
              //   highlightElevation: 16.0,
              //   highlightColor: Colors.deepPurpleAccent,
              //   onHighlightChanged: (value) {},
              // ),
              ElevatedButton.icon(
                  onPressed: () async => await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                        //   todo builder: (context) => LeaguePage(), //
                      )),
                  icon: Icon(Icons.flag),
                  label: Text('試合開始！')),
            ],
          ),
        ),
      ),
    );
  }
}
