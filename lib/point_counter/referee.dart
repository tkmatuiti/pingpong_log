import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Match{
  Match(DocumentSnapshot<Map<String,dynamic>> doc) {
    matchID = doc.id; //idはdocumentIDだった
    title = doc.data()['title'].toString();
  }
  String matchID;
  String playerAName;
  String playerBName;
  String title ;
  int pointA = 0;
  int pointB = 0;
  int tableNumber ;
}