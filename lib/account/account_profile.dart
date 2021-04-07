import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountProfile extends StatefulWidget {
  final User userData; //finalしてもいいのかな？

  AccountProfile({Key key, this.userData}) : super(key: key);

  @override
  _AccountProfileState createState() => _AccountProfileState(userData);
}

class _AccountProfileState extends State<AccountProfile> {
  User userData;
  String name = "高畠";
  String email; //email と名前は分けるセキュリティレベルが違う
  String photoUrl;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  _AccountProfileState(User userData) {
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
        title: Text("ユーザー情報"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(this.photoUrl),
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                this.email,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              ElevatedButton(
                child: Text('Sign Out Google'),
                onPressed: () {
                  _handleSignOut().catchError((e) => print(e));
                },
              ),
            ]),
      ),
    );
  }
}
