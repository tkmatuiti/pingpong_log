import 'package:flutter/material.dart';
import 'package:tt_diary/point_counter/point_counter.dart';
import 'package:tt_diary/result/result_page.dart';
import 'package:tt_diary/room/waiting_page.dart';

enum tournamentOrLeague { tournament, league }

enum singlesOrDoubles { singles , doubles}



class EditCounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<EditCounterPage> {
  final now = DateTime.now();
  var _numberOfGame = 5.0;
  var _numberOfPoint = 11.0;
  var torOrLea = tournamentOrLeague.tournament;
  void _onChangedTournamentOrLeague(tournamentOrLeague value) {
    setState(() {
      torOrLea = value;
    });
  }
  var sinOrDoub = singlesOrDoubles.singles;
  void _onChangedSinglesOrDoubles(
      singlesOrDoubles value
      ){
    setState(() {
      sinOrDoub = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditRoomPage'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: RadioListTile(
                    secondary: Icon(Icons.person),
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text('シングルス'),
                    value: singlesOrDoubles.singles,
                    groupValue: sinOrDoub,
                    onChanged: _onChangedSinglesOrDoubles,
                  ),
                ),
                GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: RadioListTile(
                    secondary: Icon(Icons.border_all),
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text('ダブルス'),
                    value: singlesOrDoubles.doubles,
                    groupValue: sinOrDoub,
                    onChanged: _onChangedSinglesOrDoubles,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'ゲーム数',
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
                  label: '$_numberOfGame' ,
                ),
                Slider(
                  value: _numberOfPoint,
                  onChanged: (d) {
                    setState(() => _numberOfPoint = d);
                  },
                  min: 1.0,
                  max: 21.0,
                  divisions: 20,
                  label: '$_numberOfPoint',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async => await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PointCounter(),
                          )),
                      icon: Icon(Icons.person),
                      label: Text('得点板に戻る'),
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
      ),
    );
  }
}
