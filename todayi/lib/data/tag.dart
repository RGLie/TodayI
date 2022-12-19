import 'dart:core';
import 'package:intl/intl.dart';

class Tag {
  String uid;
  String username;
  String tagname;
  String createdate;
  String description;
  String icon;
  bool issubtag;
  List<String> subtaglist = [];
  bool isdate;
  List<String> datelist = [];

  Tag({
    required this.uid,
    required this.username,
    required this.tagname,
    required this.createdate,
    required this.description,
    required this.icon,
    required this.issubtag,
    required this.subtaglist,
    required this.isdate,
    required this.datelist,
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
      'subtaglist': subtaglist,
      'isdate':isdate,
      'datelist': datelist
    };
  }

  factory Tag.fromMap(Map<String, dynamic>? map) {
    List<String> subtags = [];
    List<String> dates = [];
    subtags.addAll(List.from(map!['subtaglist']));
    dates.addAll(List.from(map['datelist']));

    return Tag(
        uid: map['uid'],
        username: map['username'],
        tagname: map['tagname'],
        createdate: map['createdate'],
        description: map['description'],
        icon: map['icon'],
        issubtag: map['issubtag'],
        subtaglist: subtags,
        isdate: map['isdate'],
        datelist: dates
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
        'subtaglist': subtaglist,
        'isdate':isdate,
        'datelist': datelist
      };
}
