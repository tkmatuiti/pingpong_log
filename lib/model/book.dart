import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot<Map<String,dynamic>> doc) {
    documentID = doc.id; //idはdocumentIDだった
    title = doc.data()['title'].toString();
    imageURL = doc.data()['imageURL'].toString();
  }

  String documentID;
  String title;
  String imageURL;
}
