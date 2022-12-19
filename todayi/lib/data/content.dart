import 'dart:core';
import 'package:intl/intl.dart';

class NoteContent {
  String uid= '';
  String contentid = '';
  String createdate = '';
  String lastupdatedate = '';
  String content = '';
  bool iscode = false;
  bool islink = false;
  bool isproperty = false;
  bool issubtag = false;
  String code = '';
  String link = '';
  String subtag = '';
  bool property1 = false;
  bool property2 = false;
  bool property3 = false;
  bool property4 = false;
  bool property5 = false;

  NoteContent({
    this.uid= '',
    this.contentid = '',
    this.createdate = '',
    this.lastupdatedate = '',
    this.content = '',
    this.iscode = false,
    this.islink = false,
    this.isproperty = false,
    this.issubtag = false,
    this.code = '',
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
      'createdate': createdate,
      'lastupdatedate': lastupdatedate,
      'content': content,
      'iscode': iscode,
      'islink': islink,
      'isproperty': isproperty,
      'issubtag': issubtag,
      'code': code,
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
        createdate: map['createdate'],
        lastupdatedate: map['lastupdatedate'],
        content: map['content'],
        iscode: map['iscode'],
        islink: map['islink'],
        isproperty: map['isproperty'],
        issubtag: map['issubtag'],
        code: map['code'],
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
      'createdate': createdate,
      'lastupdatedate': lastupdatedate,
      'content': content,
      'iscode': iscode,
      'islink': islink,
      'isproperty': isproperty,
      'issubtag': issubtag,
      'code': code,
      'link': link,
      'subtag': subtag,
      'proeprty1': property1,
      'property2': property2,
      'property3': property3,
      'property4': property4,
      'property5': property5,
      };
}
