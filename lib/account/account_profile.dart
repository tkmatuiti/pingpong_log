import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountProfilePage extends StatefulWidget {
  final User userData; //finalしてもいいのかな？

  AccountProfilePage({Key key, this.userData}) : super(key: key);

  @override
  _AccountProfilePageState createState() => _AccountProfilePageState(userData);
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  User userData;
  String name = 'e';
  String email; //email と名前は分けるセキュリティレベルが違う
  String photoUrl;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  _AccountProfilePageState(User userData) {
    this.userData = userData;
    this.name = userData.displayName;
    this.email = userData.email;
    this.photoUrl = userData.photoURL;
  }

  Future<void> _handleSignOut() async {
    await FirebaseAuth.instance.signOut();
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ユーザー情報"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(this.photoUrl),
              Text(
                this.name,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                // ignore: unnecessary_this
                this.email,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _handleSignOut().catchError(() => print('e'));
                },
                child: const Text('Sign Out Google'),
              ),
            ]),
      ),
    );
  }
}
