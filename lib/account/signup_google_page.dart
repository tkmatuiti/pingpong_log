import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'account_profile_page.dart';

class SignupGoogle extends StatefulWidget {
  const SignupGoogle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupGoogleState createState() => SignupGoogleState();
}

class SignupGoogleState extends State<SignupGoogle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> _handleSignIn() async {
    var googleCurrentUser = _googleSignIn.currentUser;
    try {
      googleCurrentUser ??= await _googleSignIn.signInSilently();
      googleCurrentUser ??= await _googleSignIn.signIn();
      if (googleCurrentUser == null) {
        return null;
      }

      final googleAuth = await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      print("signed in ${user.displayName}");

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void transitionNextPage(User user) {
    if (user == null) return;

    Navigator.push<Route>(
        context,
        MaterialPageRoute<Route>(
            builder: (context) => AccountProfilePage(userData: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Google'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _handleSignIn()
                      .then(transitionNextPage)
                      .catchError(() => print('$e'));
                },
                child: const Text('Sign in Google'),
              ),
            ]),
      ),
    );
  }
}
