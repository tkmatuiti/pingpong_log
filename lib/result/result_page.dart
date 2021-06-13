import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '結果:${now}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.cyan,
                    child: Text('UserA'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black38,
                    child: Center(
                      child: TextField(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.cyan,
                    child: Text('UserB'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
