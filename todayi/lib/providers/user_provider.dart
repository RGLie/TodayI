

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todayi/data/user.dart';

class UserProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // User 1명의 데이터 읽기
  Future<TUser> getUser(String uid) async {
    var snap = await _db.collection('user').doc(uid).get();

    Map<String, dynamic>? user_data = snap.data();

    return TUser.fromMap(user_data);
  }
}