import 'package:flutter/material.dart';
import 'package:tt_diary/room/waiting_page.dart';

enum tournamentOrLeague { tournament, league }

class CreateRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CreateRoomPage> {
  final now = DateTime.now();
  var _single = true;
  var _double = false;
  var _other = false;
  var _numberOfGame = 1.0;
  var torOrLea = tournamentOrLeague.tournament;
  void _onChanged(tournamentOrLeague value) {
    setState(() {
      torOrLea = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateRoomPage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  icon: Icon(Icons.people),
                  labelText: '参加可能人数',
                ),
                keyboardType: TextInputType.number,
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: SizedBox(
                  height: 20.0,
                  width: double.infinity,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: Text(
                  'ルール！',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: RadioListTile(
                  secondary: Icon(Icons.table_chart),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text('トーナメント'),
                  value: tournamentOrLeague.tournament,
                  groupValue: torOrLea,
                  onChanged: _onChanged,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: RadioListTile(
                  secondary: Icon(Icons.border_all),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text('総当たりリーグ戦'),
                  value: tournamentOrLeague.league,
                  groupValue: torOrLea,
                  onChanged: _onChanged,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: CheckboxListTile(
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
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: CheckboxListTile(
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
              ),
              CheckboxListTile(
                title: Text('チーム'),
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
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'ゲーム数',
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
              ElevatedButton.icon(
                onPressed: () async => await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WaitingPage(),
                    )),
                icon: Icon(Icons.flag),
                label: Text('ルーム作成'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
