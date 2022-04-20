import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_diary/point_counter/point_counter.dart';
import 'package:tt_diary/result/result_page.dart';
import 'package:tt_diary/room/waiting_page.dart';

enum tournamentOrLeague { tournament, league }
enum singlesOrDoubles { singles, doubles }
final todayRivalTextController = TextEditingController();
final titleTextController = TextEditingController();

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({Key key}) : super(key: key);

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
  var _numberOfPoint = 1.0;
  var torOrLea = tournamentOrLeague.tournament;
  void _onChanged(tournamentOrLeague value) {
    setState(() {
      torOrLea = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      //縦固定
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateRoomPage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.create),
                  labelText: 'タイトル',
                ),
                controller: titleTextController,
              ),
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: '参加可能人数',
                ),
                keyboardType: TextInputType.number,
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: const SizedBox(
                  height: 20.0,
                  width: double.infinity,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: const Text(
                  'ルール！',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: RadioListTile(
                  secondary: const Icon(Icons.table_chart),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('トーナメント'),
                  value: tournamentOrLeague.tournament,
                  groupValue: torOrLea,
                  onChanged: _onChanged,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: RadioListTile(
                  secondary: const Icon(Icons.border_all),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('リーグ戦'),
                  value: tournamentOrLeague.league,
                  groupValue: torOrLea,
                  onChanged: _onChanged,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: CheckboxListTile(
                  title: const Text('シングルス'),
                  secondary: const Icon(Icons.person),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _single,
                  onChanged: (bool value) {
                    setState(() {
                      _single = value;
                      _double = false;
                      _other = false;
                    });
                  },
                  activeColor: Colors.white24,
                  checkColor: Colors.cyanAccent,
                ),
              ),
              GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: CheckboxListTile(
                  title: const Text('ダブルス'),
                  secondary: const Icon(Icons.people),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _double,
                  onChanged: (bool value) {
                    setState(() {
                      _single = false;
                      _other = false;
                      _double = value;
                    });
                  },
                  activeColor: Colors.white24,
                  checkColor: Colors.cyanAccent,
                ),
              ),
              CheckboxListTile(
                title: const Text('チーム'),
                secondary: const Icon(Icons.person),
                controlAffinity: ListTileControlAffinity.leading,
                value: _other,
                onChanged: (bool value) {
                  setState(() {
                    _single = false;
                    _double = false;
                    _other = value;
                  });
                },
                activeColor: Colors.white24,
                checkColor: Colors.cyanAccent,
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.people_outline),
                  border: InputBorder.none,
                  hintText: '対戦相手の名前',
                ),
                controller: todayRivalTextController,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: const Text(
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
                label: '$_numberOfGame',
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
                          builder: (context) => PointCounter(
                              titleTextController.text,
                              todayRivalTextController.text),
                        )),
                    icon: const Icon(Icons.person),
                    label: const Text('得点板'),
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
                    icon: const Icon(Icons.person),
                    label: const Text('試合結果を入力'),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async => await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WaitingPage(),
                    )),
                icon: const Icon(Icons.flag),
                label: const Text('ルーム作成'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
