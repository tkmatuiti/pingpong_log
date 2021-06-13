import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_diary/add_book/add_book_model.dart';
import 'package:tt_diary/signup/signup_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('SignUp!'),
          ),
          body: Consumer<SignUpModel>(
            builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'examaple_mail_address@gmail.com'),
                      controller: mailController,
                      onChanged: (text) {
                        model.mail = text;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'password'),
                      obscureText: true,
                      controller: passwordController,
                      onChanged: (text) {
                        model.password = text;
                      },
                    ),
                    ElevatedButton(
                        child: Text('登録する'),
                        onPressed: () async {
                          try {
                            await model.signUp();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('登録完了！'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(e.toString()),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future addBook(AddBookModel model, BuildContext context) async {
    try {
      //add book to　firestore
      await model.addBookToFirebase();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Saved!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      Navigator.of(context).pop();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('エラー'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
//todo
//   Future updateBook(AddBookModel model, BuildContext context) async {
//     try {
//       await model.updateBook(book);
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('UPDATE!'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       Navigator.of(context).pop();
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(e.toString()),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
}
