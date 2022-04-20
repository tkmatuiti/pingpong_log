import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../account/signup_google_page.dart';
import '../book_list/book_list_page.dart';
import '../login/login_page.dart';
import '../room/create_room_page.dart';
import 'edit_account-pagae.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      //縦固定
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text(
            'PingPongMix',
            style: TextStyle(fontFamily: 'KiwiMaru', fontSize: 30),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => Navigator.push<Route>(
                    context,
                    MaterialPageRoute<Route>(
                        builder: (context) => EditAccountPage())),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        label: const Text('日々の気付き')),
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
            final dynamic result = await Navigator.of(context).push<dynamic>(
              MaterialPageRoute<dynamic>(
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
