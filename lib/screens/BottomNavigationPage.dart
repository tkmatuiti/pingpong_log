// bottom_navigation_bar.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_diary/model/botom_navigate_model.dart';
import 'package:tt_diary/room/create_room_page.dart';
import 'package:tt_diary/screens/my_home_page.dart';

class BottomNavigationPage extends StatelessWidget {
  // 表示するページをリスト形式で宣言します
  List<Widget> _pageList = <Widget>[
    CreateRoomPage(),
    MyHomePage(),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        accentColor: Colors.black,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(11)))),
        fontFamily: "KiwiMaru",
      ),
      home: ChangeNotifierProvider<BottomNavigationModel>(
        create: (_) => BottomNavigationModel(),
        child:
            Consumer<BottomNavigationModel>(builder: (context, model, child) {
          return Scaffold(
            // 今選択している番号のページを呼び出します。
            body: _pageList[model.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              // 選択時の色やBarの色など設定できます。
              backgroundColor: Colors.black,
              // 選択中のアイコンを更新しています。
              currentIndex: model.selectedIndex,

              // ここからが肝です。
              onTap: (index) {
                // indexで今タップしたアイコンの番号にアクセスできます。
                model.selectedIndex =
                    index; // indexをモデルに渡したときに notifyListeners(); を呼んでいます。
              },
              items: [
                // フッターアイコンの要素を並べています 最低2個以上必要みたいです。
                BottomNavigationBarItem(
                  // アイコンとラベルは自由にカスタムしてください。
                  icon: Icon(
                    Icons.person,
                    color: Colors.pinkAccent,
                  ),
                  label: 'アカウント',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school, color: Colors.purpleAccent),
                  label: 'ルーム',
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
