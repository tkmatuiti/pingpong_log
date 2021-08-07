import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tt_diary/room/create_room_page.dart';

import 'edit_counter_page.dart';

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

  void _resetPoints() {
    setState(() {
      _a_point = 0;
      _b_point = 0;
    });
  }

  void _incrementAGame() {
    setState(() {
      _a_point++;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _resetPoints();
        _a_game++;
      });
    });
  }

  void _incrementBGame() {
    setState(() {
      _b_point++;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _resetPoints();
        _b_game++;
      });
    });
  }

  void _decrementAPoint() {
    setState(() {
      _a_point--;
    });
  }

  void _decrementBPoint() {
    setState(() {
      _b_point--;
    });
  }

  void _decrementAGame() {
    setState(() {
      _a_game--;
    });
  }

  void _decrementBGame() {
    setState(() {
      _b_game--;
    });
  }

  void _resetGames() {
    setState(() {
      _a_game = 0;
      _b_game = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pointColor = Colors.orange;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(bookTitle),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () =>Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> EditCounterPage(),))
            ),
            IconButton(
              icon: Icon(Icons.event_note),
              onPressed: () =>
                  FirebaseFirestore.instance.collection('books').add({
                    'title': '$bookTitle \n $_a_game  - $_b_game',
                    'create': Timestamp.now(),

                  }),
            ),
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
                    if (_a_point >= 10 && _a_point >= _b_point + 1) {
                      _incrementAGame();
                    } else {
                      _incrementAPoint();
                    }
                  },
                  onLongPress: () { //todo tapdownに対応したい
                    _decrementAPoint();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.indigo,
                      child: Column(
                        children: [
                          Text('$_a_point', style: TextStyle(fontSize: 80),),
                          Text('sotaro', style: TextStyle(fontSize: 30,
                              color: pointColor),),
                        ],
                      ),
                    ),
                  ),
                ),
              ), Expanded(
                flex: 2,
                child: Column(
                  children: [
                    InkWell(
                      onLongPress: () { //todo tapdownに対応したい
                        _decrementAGame();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.indigo,
                          child: Column(
                            children: [

                              Text('$_a_game', style: TextStyle(fontSize: 30),),

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
                          color: Colors.indigo,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text('reset',
                                    style: TextStyle(fontSize: 20),),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ), Expanded(
                flex: 2,
                child: Column(
                  children: [
                    InkWell(

                      onLongPress: () { //todo tapdownに対応したい
                        _decrementBGame();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.indigo,
                          child: Text('$_b_game',
                                    style: TextStyle(fontSize: 30),),
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
                          color: Colors.indigo,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text('reset',
                                    style: TextStyle(fontSize: 20),),

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
                flex: 3,
                child: InkWell(
                  onTap: () {
                    if (_b_point >= 10 && _b_point >= _a_point + 1) {
                      _incrementBGame();
                    } else {
                      _incrementBPoint();
                    }
                  },
                  onLongPress: () { //todo tapdownに対応したい
                    _decrementBPoint();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.indigo,
                      child: Column(
                        children: [
                          Text('$_b_point', style: TextStyle(fontSize: 80),),
                          Text('sotaro', style: TextStyle(fontSize: 30,
                              color: pointColor),),
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
