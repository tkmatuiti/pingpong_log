import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    documentID = doc.id; //idはdocumentIDだった
    title = doc.data()['title'];
    imageURL = doc.data()['imageURL'];
  }

  String documentID;
  String title;
  String imageURL;
}
