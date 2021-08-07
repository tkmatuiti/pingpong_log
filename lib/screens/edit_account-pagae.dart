import 'package:flutter/material.dart';

class EditAccountPage extends StatefulWidget {
  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/pingpongmixyellow.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('PingPongアカウントの編集'))
        ],
      )),
      body: Center(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

//todo
//メールアドレスとニックネームなど、セキュリティレベルの違うものを同じコレクションにしない。
