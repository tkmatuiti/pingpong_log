import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tt_diary/model/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw 'タイトルを入力してください！';
    }
    FirebaseFirestore.instance.collection('books').add(<String, dynamic>{
      'title': bookTitle,
      'create': Timestamp.now(),
    });
  }

  Future updateBook(Book book) async {
    final document =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    await document.update({
      'title': bookTitle,
      'upDateAt': Timestamp.now(),
    });
  }
}
