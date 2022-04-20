import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tt_diary/book_list/book_list_page.dart';

import 'edit_counter_page.dart';

class PointCounter extends StatefulWidget {
  PointCounter(this.title, this.rivalName, {Key key}) : super(key: key);
  String rivalName;
  String title;

  @override
  _PointCounterState createState() => _PointCounterState(title, rivalName);
}

DateTime now = DateTime.now();
DateFormat outputFormat = DateFormat('yyyy-MM-dd');
String date = outputFormat.format(now);

class _PointCounterState extends State<PointCounter> {
  _PointCounterState(this.bookTitle, this.rivalNameText);

  String bookTitle;
  String rivalNameText;

  int _aPoint = 0;
  int _bPoint = 0;

  int _aGame = 0;
  int _bGame = 0;

  void _incrementAPoint() {
    setState(() {
      _aPoint++;
    });
  }

  void _incrementBPoint() {
    setState(() {
      _bPoint++;
    });
  }

  void _resetPoints() {
    setState(() {
      _aPoint = 0;
      _bPoint = 0;
    });
  }

  void _incrementAGame() {
    setState(() {
      _aPoint++;
    });
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        _resetPoints();
        _aGame++;
      });
    });
  }

  void _incrementBGame() {
    setState(() {
      _bPoint++;
    });
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        _resetPoints();
        _bGame++;
      });
    });
  }

  void _decrementAPoint() {
    setState(() {
      _aPoint--;
    });
  }

  void _decrementBPoint() {
    setState(() {
      _bPoint--;
    });
  }

  void _decrementAGame() {
    setState(() {
      _aGame--;
    });
  }

  void _decrementBGame() {
    setState(() {
      _bGame--;
    });
  }

  void _resetGames() {
    setState(() {
      _aGame = 0;
      _bGame = 0;
    });
  }

  void noteLog(String date, String rivalNameText, String bookTitle, int _aGame,
      int _bGame) async {
    await FirebaseFirestore.instance.collection('books').add(<String, dynamic>{
      'title': '$date $bookTitle vs$rivalNameText \n'
          '$_aGame-$_bGame',
      'create': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      //横固定
      DeviceOrientation.landscapeLeft,
    ]);
    var pointColor = Colors.orange;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$bookTitle vs $rivalNameText'),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.push<Route>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCounterPage(),
                    ))),
            IconButton(
                icon: Icon(Icons.event_note),
                onPressed: () =>
                    noteLog(date, rivalNameText, bookTitle, _aGame, _bGame)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    if (_aPoint >= 10 && _aPoint >= _bPoint + 1) {
                      _incrementAGame();
                    } else {
                      _incrementAPoint();
                    }
                  },
                  onLongPress: () {
                    //todo tapdownに対応したい
                    _decrementAPoint();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Color.fromRGBO(1, 86, 117, 1),
                      child: Column(
                        children: [
                          Text(
                            '$_aPoint',
                            style: TextStyle(fontSize: 80),
                          ),
                          Text(
                            'sotaro',
                            style: TextStyle(fontSize: 30, color: pointColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    InkWell(
                      onLongPress: () {
                        _decrementAGame();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Color.fromRGBO(1, 86, 117, 1),
                          child: Column(
                            children: [
                              Text(
                                '$_aGame',
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onLongPress: () {
                        _resetGames();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Color.fromRGBO(1, 86, 117, 1),
                          child: Column(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'reset',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    InkWell(
                      onLongPress: () {
                        _decrementBGame();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Color.fromRGBO(1, 86, 117, 1),
                          child: Text(
                            '$_bGame',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          icon: const Icon(
                            Icons.note_add_outlined,
                            size: 40,
                          ),
                          tooltip: 'ノートに記入',
                          onPressed: () {
                            noteLog(
                                date, rivalNameText, bookTitle, _aGame, _bGame);
                            Navigator.push<Route>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookListPage(),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    if (_bPoint >= 10 && _bPoint >= _aPoint + 1) {
                      _incrementBGame();
                    } else {
                      _incrementBPoint();
                    }
                  },
                  onLongPress: () {
                    _decrementBPoint();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Color.fromRGBO(1, 86, 117, 1),
                      child: Column(
                        children: [
                          Text(
                            '$_bPoint',
                            style: TextStyle(fontSize: 80),
                          ),
                          Text(
                            rivalNameText,
                            style: TextStyle(fontSize: 30, color: pointColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
