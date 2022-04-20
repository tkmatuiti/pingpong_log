import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tt_diary/add_book/add_book_page.dart';
import 'package:tt_diary/book_list/book_list_model.dart';
import 'package:tt_diary/model/book.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      //縦固定
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bookリスト'),
            actions: <Widget>[
              Consumer<BookListModel>(builder: (context, model, child) {
                return IconButton(
                    icon: Icon(Icons.add_comment),
                    onPressed: () async {
                      await model.fetchBooks();
                      await Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => AddBookPage(),
                          fullscreenDialog: true,
                        ),
                      );
                    });
              }),
            ],
          ),
          body: Consumer<BookListModel>(
            builder: (context, model, snapshot) {
              final books = model.books;
              final listTiles = books
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                      trailing: IconButton(
                        icon: Icon(Icons.create),
                        iconSize: 20.0,
                        onPressed: () async {
                          await Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => AddBookPage(
                                book: book,
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                          model.fetchBooks();
                        },
                      ),
                      onLongPress: () async {
                        //todo delete
                        await showDialog<BookListPage>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('delete ${book.title}  ?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    //削除のAPIを叩く
                                    await deleteBook(context, model, book);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                  .toList();
              return ListView(
                children: listTiles,
              );
            },
          ),
        ),
      ),
    );
  }
}

Future deleteBook(BuildContext context, BookListModel model, Book book) async {
  try {
    await model.deleteBook(book);
    await model.fetchBooks();
    await showDialog<BookListPage>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete!'),
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
    await showDialog<BookListPage>(
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
