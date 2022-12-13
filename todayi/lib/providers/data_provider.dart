

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todayi/data/note.dart';
import 'package:todayi/data/user.dart';

class DataProvider extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  

  // User 1명의 데이터 읽기
  Stream<TUser> getUser(String uid) {
    //var snap =  _db.collection('users').doc(uid).snapshots();
    //Map<String, dynamic>? user_data = snap.data;

    // return TUser.fromMap(user_data);
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots().map((doc) => TUser.fromMap(doc.data()));
  }

  Stream<List<Note>> getNotes(String uid) {
    return FirebaseFirestore.instance.collection('users').doc(uid).collection('tags').snapshots()
    .map((list) =>
        list.docs.map((doc) => Note.fromMap(doc.data())).toList());
  }

}