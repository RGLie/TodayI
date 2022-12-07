

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todayi/data/user.dart';

class TagProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // User 1명의 데이터 읽기
  Stream<TUser> getTags(String uid) async* {
    var snap = await _db.collection('users').doc(uid).get();

    Map<String, dynamic>? user_data = snap.data();

    yield TUser.fromMap(user_data);
  }

}