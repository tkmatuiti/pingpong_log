import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '試合結果！${now}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Text('${now}'),
      ),
    );
  }
}
