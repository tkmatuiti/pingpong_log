import 'package:flutter/material.dart';
import 'package:tt_diary/account/account_profile.dart';
import 'package:tt_diary/account/signup_google.dart';
import 'package:tt_diary/login/login_page.dart';
import 'package:tt_diary/room/create_room_page.dart';
import 'package:tt_diary/book_list/book_list_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.pink,
      accentColor: Colors.black,
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(11)))),
      fontFamily: "KiwiMaru",
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TT_DIARY',
            style: TextStyle(fontFamily: 'TrainOne', fontSize: 30),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountProfile())),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () async => await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookListPage())),
                        icon: Icon(Icons.wb_incandescent),
                        label: Text('日々の気付き')),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () async => await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookListPage())),
                        icon: Icon(Icons.event_note),
                        label: Text('戦績管理')),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () async => await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        icon: Icon(Icons.person),
                        label: Text(' ログイン')),
                  )
                ],
              ),
              ElevatedButton.icon(
                onPressed: () async => await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupGoogle(),
                    )),
                icon: Icon(Icons.person),
                label: Text('Google Sign Up'),
              ),
              ElevatedButton.icon(
                onPressed: () async => await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateRoomPage(),
                    )),
                icon: Icon(Icons.person),
                label: Text('ルームを作成'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateRoomPage(),
              ),
            );
            print(result);
          },
          tooltip: '試合を記録',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
