import 'dart:core';
import 'package:intl/intl.dart';

class TUser {
  String uid;
  String email;
  String name;
  String registerdate;
  String recentlogindate;
  bool istag;
  List<String> taglist = [];

  TUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.registerdate,
    required this.recentlogindate,
    required this.istag,
    required this.taglist,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'registerdate': registerdate,
      'recentlogindate': recentlogindate,
      'istag':istag,
      'taglist': taglist,
    };
  }

  factory TUser.fromMap(Map<String, dynamic>? map) {
    return TUser(
        uid: map!['uid'],
        email: map['email'],
        name: map['name'],
        registerdate: map['registerdate'],
        recentlogindate: map['recentlogindate'],
        istag: map['istag'],
        taglist: map['taglist'],
        );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'registerdate': registerdate,
        'recentlogindate': recentlogindate,
        'istag':istag,
        'taglist': taglist,
      };
}
