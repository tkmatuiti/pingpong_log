import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tt_diary/screens/BottomNavigationPage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PingPongMix',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(11)))),
        fontFamily: "KiwiMaru",

      ),
      home: BottomNavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
