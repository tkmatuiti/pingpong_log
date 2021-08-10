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
          title: Text('アカウント編集'),
          ),
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
