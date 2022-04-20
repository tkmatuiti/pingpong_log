import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_diary/header.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //向き固定
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      //縦固定
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: Header(),
      body: Text('choleycholey'),
    );
  }
}
