import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('ログイン'),
          ),
          body: Consumer<LoginModel>(
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
                        child: Text('ログインする'),
                        onPressed: () async {
                          try {
                            await model.login();
                            await showDialog<LoginPage>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('ログイン！'),
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
                            await showDialog<LoginPage>(
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
}
