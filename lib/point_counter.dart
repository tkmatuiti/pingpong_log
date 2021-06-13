import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tt_diary/add_book/add_book_model.dart';

class PointCounter extends StatefulWidget {
  const PointCounter({Key key}) : super(key: key);

  @override
  _PointCounterState createState() => _PointCounterState();
}

class _PointCounterState extends State<PointCounter> {
  String bookTitle = 'Sotaro VS Takashi';

  var _a_point = 0;
  var _b_point = 0;

  var _a_game = 0;
  var _b_game = 0;

  void _incrementAPoint() {
    setState(() {
      _a_point++;
    });
  }

  void _incrementBPoint() {
    setState(() {
      _b_point++;
    });
  }

  void _incrementAGame() {
    setState(() {
      _a_game++;
    });
  }

  void _incrementBGame() {
    setState(() {
      _b_game++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('得点板'),
          actions: [
            IconButton(
              icon: Icon(Icons.event_note),
              onPressed: () =>
                  FirebaseFirestore.instance.collection('books').add({
                'title': bookTitle,
                'create': Timestamp.now(),
              }),
            ),
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (_a_point == 10) {
                    _a_point = 0;
                    _incrementAGame();
                  } else {
                    _incrementAPoint();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.cyan,
                  child: Column(
                    children: [
                      Text('sotaro'),
                      Text('$_a_game'),
                      Text('$_a_point'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (_b_point == 10) {
                    _b_point = 0;
                    _incrementBGame();
                  } else {
                    _incrementBPoint();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.deepOrangeAccent,
                  child: Column(
                    children: [
                      Text('takeshi'),
                      Text('$_b_game'),
                      Text('$_b_point'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
