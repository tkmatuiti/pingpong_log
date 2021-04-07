import 'package:flutter/material.dart';
import 'package:tt_diary/account/signup_google.dart';
import 'package:tt_diary/result/result_page.dart';

class TournamentPage extends StatefulWidget {
  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  final now = DateTime.now();
  var _single = true;
  var _double = false;
  var _other = false;

  var _numberOfGame = 1.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('試合を記録！$now'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.create),
                    labelText: 'タイトル',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person_outline), labelText: '対戦相手'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    '最大ゲーム数',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Slider(
                  value: _numberOfGame,
                  onChanged: (d) {
                    setState(() => _numberOfGame = d);
                  },
                  min: 1.0,
                  max: 7.0,
                  divisions: 6,
                  label: '$_numberOfGame',
                ),
                CheckboxListTile(
                  title: Text('シングルス'),
                  secondary: Icon(Icons.person),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _single,
                  onChanged: (bool value) {
                    setState(() {
                      _single = value;
                      _double = false;
                      _other = false;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.amberAccent,
                ),
                CheckboxListTile(
                  title: Text('ダブルス'),
                  secondary: Icon(Icons.people),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _double,
                  onChanged: (bool value) {
                    setState(() {
                      _single = false;
                      _other = false;
                      _double = value;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.amberAccent,
                ),
                CheckboxListTile(
                  title: Text('変則'),
                  secondary: Icon(Icons.person),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _other,
                  onChanged: (bool value) {
                    setState(() {
                      _single = false;
                      _double = false;
                      _other = value;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.amberAccent,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async => await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupGoogle(),
                          )),
                      icon: Icon(Icons.person),
                      label: Text('得点板'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async => await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(),
                          )),
                      icon: Icon(Icons.person),
                      label: Text('試合結果を入力'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
