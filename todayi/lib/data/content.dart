import 'dart:core';
import 'package:intl/intl.dart';

class NoteContent {
  String uid = '';
  String contentid = '';
  int count = 0;
  String tag = '';
  String contentdate = '';
  String lastupdatedate = '';
  String content = '';
  bool iscode = false;
  bool islink = false;
  bool isproperty = false;
  bool issubtag = false;
  String code = '';
  String language = '';
  String link = '';
  String subtag = '';
  bool property1 = false;
  bool property2 = false;
  bool property3 = false;
  bool property4 = false;
  bool property5 = false;

  NoteContent({
    this.uid = '',
    this.contentid = '',
    this.count = 0,
    this.tag = '',
    this.contentdate = '',
    this.lastupdatedate = '',
    this.content = '',
    this.iscode = false,
    this.islink = false,
    this.isproperty = false,
    this.issubtag = false,
    this.code = '',
    this.language = '',
    this.link = '',
    this.subtag = '',
    this.property1 = false,
    this.property2 = false,
    this.property3 = false,
    this.property4 = false,
    this.property5 = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'contentid': contentid,
      'count': count,
      'tag': tag,
      'contentdate': contentdate,
      'lastupdatedate': lastupdatedate,
      'content': content,
      'iscode': iscode,
      'islink': islink,
      'isproperty': isproperty,
      'issubtag': issubtag,
      'code': code,
      'language': language,
      'link': link,
      'subtag': subtag,
      'property1': property1,
      'property2': property2,
      'property3': property3,
      'property4': property4,
      'property5': property5,
    };
  }

  factory NoteContent.fromMap(Map<String, dynamic>? map) {
    return NoteContent(
      uid: map!['uid'],
      contentid: map['contentid'],
      count: map['count'],
      tag: map['tag'],
      contentdate: map['contentdate'],
      lastupdatedate: map['lastupdatedate'],
      content: map['content'],
      iscode: map['iscode'],
      islink: map['islink'],
      isproperty: map['isproperty'],
      issubtag: map['issubtag'],
      code: map['code'],
      language: map['language'],
      link: map['link'],
      subtag: map['subtag'],
      property1: map['proeprty1'],
      property2: map['property2'],
      property3: map['property3'],
      property4: map['property4'],
      property5: map['property5'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'contentid': contentid,
        'count':count,
        'tag': tag,
        'contentdate': contentdate,
        'lastupdatedate': lastupdatedate,
        'content': content,
        'iscode': iscode,
        'islink': islink,
        'isproperty': isproperty,
        'issubtag': issubtag,
        'code': code,
        'language': language,
        'link': link,
        'subtag': subtag,
        'proeprty1': property1,
        'property2': property2,
        'property3': property3,
        'property4': property4,
        'property5': property5,
      };
}
