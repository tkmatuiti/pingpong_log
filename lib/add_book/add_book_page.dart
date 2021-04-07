import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_diary/add_book/add_book_model.dart';
import 'package:tt_diary/model/book.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    final textEditingController = TextEditingController();

    if (isUpdate) {
      textEditingController.text = book.title;
    }

    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(isUpdate ? 'TT-Log　Edit' : 'TT-Log　Create'),
          ),
          body: Consumer<AddBookModel>(
            builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: textEditingController,
                      onChanged: (text) {
                        model.bookTitle = text;
                      },
                    ),
                    ElevatedButton(
                        child: Text(isUpdate ? '更新する' : '追加する'),
                        onPressed: () async {
                          if (isUpdate) {
                            // firestoreに本を更新
                            await updateBook(model, context);
                          } else {
                            await addBook(model, context); //firestoreに本を追加
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
  }

  Future updateBook(AddBookModel model, BuildContext context) async {
    try {
      await model.updateBook(book);
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('UPDATE!'),
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
  }
}
