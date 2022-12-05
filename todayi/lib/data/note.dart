import 'dart:core';
import 'package:intl/intl.dart';

class Note {
  String uid;
  String username;
  String tagname;
  String createdate;
  String description;
  String icon;
  bool issubtag;
  List<String> subtaglist = [];

  Note({
    required this.uid,
    required this.username,
    required this.tagname,
    required this.createdate,
    required this.description,
    required this.icon,
    required this.issubtag,
    required this.subtaglist
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'tagname': tagname,
      'createdate': createdate,
      'description': description,
      'icon': icon,
      'issubtag':issubtag,
      'subtaglist': subtaglist
    };
  }

  factory Note.fromMap(Map<String, dynamic>? map) {
    return Note(
        uid: map!['uid'],
        username: map['username'],
        tagname: map['tagname'],
        createdate: map['createdate'],
        description: map['description'],
        icon: map['icon'],
        issubtag: map['issubtag'],
        subtaglist: map['subtaglist']
        );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'tagname': tagname,
        'createdate': createdate,
        'description': description,
        'icon': icon,
        'issubtag':issubtag,
        'subtaglist': subtaglist
      };
}
