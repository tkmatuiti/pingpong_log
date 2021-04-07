import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'account_profile.dart';

class SignupGoogle extends StatefulWidget {
  SignupGoogle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupGoogleState createState() => SignupGoogleState();
}

class SignupGoogleState extends State<SignupGoogle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;
    try {
      if (googleCurrentUser == null)
        googleCurrentUser = await _googleSignIn.signInSilently();
      if (googleCurrentUser == null)
        googleCurrentUser = await _googleSignIn.signIn();
      if (googleCurrentUser == null) return null;

      GoogleSignInAuthentication googleAuth =
          await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void transitionNextPage(User user) {
    if (user == null) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountProfile(userData: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Google'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Sign in Google'),
                onPressed: () {
                  _handleSignIn()
                      .then((User user) => transitionNextPage(user))
                      .catchError((e) => print(e));
                },
              ),
            ]),
      ),
    );
  }
}
