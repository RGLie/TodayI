import 'dart:core';
import 'package:intl/intl.dart';

class TUser {
  String uid;
  String email;
  String name;
  String registerdate;
  String recentlogindate;
  int count;
  bool istag;
  List<String> taglist = [];

  TUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.registerdate,
    required this.recentlogindate,
    required this.count,
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
      'count': count,
      'istag': istag,
      'taglist': taglist,
    };
  }

  factory TUser.fromMap(Map<String, dynamic>? map) {
    List<String> tags = [];
    tags.addAll(List.from(map!['taglist']));
    return TUser(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      registerdate: map['registerdate'],
      recentlogindate: map['recentlogindate'],
      count: map['count'],
      istag: map['istag'],
      taglist: tags,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'registerdate': registerdate,
        'recentlogindate': recentlogindate,
        'count': count,
        'istag': istag,
        'taglist': taglist,
      };
}
