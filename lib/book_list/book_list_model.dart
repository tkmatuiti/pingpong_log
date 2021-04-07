import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tt_diary/model/book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBooks() async {
    final docs = await FirebaseFirestore.instance.collection('books').get();
    final books =
        docs.docs.map((doc) => Book(doc)).toList(); //docsの中身をmap変換するtolistに
    this.books = books;
    notifyListeners();
  }

  Future deleteBook(Book book) async {
    await FirebaseFirestore.instance
        .collection('books')
        .doc(book.documentID)
        .delete();
  }
}
