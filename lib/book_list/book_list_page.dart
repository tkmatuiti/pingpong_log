import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tt_diary/book_list/book_list_model.dart';
import 'package:tt_diary/model/book.dart';
import 'package:tt_diary/add_book/add_book_page.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //向き固定
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
    //縦固定
    DeviceOrientation.portraitUp,
    //横固定
    // DeviceOrientation.landscapeLeft,
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
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddBookPage(),
                          fullscreenDialog: true,
                        ),
                      );
                      model.fetchBooks();
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
                          await Navigator.push(
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
                        await showDialog(
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
    await showDialog(
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
    await showDialog(
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
