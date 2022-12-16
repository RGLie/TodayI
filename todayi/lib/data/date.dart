import 'dart:core';
import 'package:intl/intl.dart';

class NoteDate {
  bool iscontent;
  bool issubtag;
  List<String> subtaglist = [];

  NoteDate({
    required this.iscontent,
    required this.issubtag,
    required this.subtaglist,
  });

  Map<String, dynamic> toMap() {
    return {
      'iscontent': iscontent,
      'issubtag': issubtag,
      'subtaglist': subtaglist,
    };
  }

  factory NoteDate.fromMap(Map<String, dynamic>? map) {
    List<String> subtags = [];
    subtags.addAll(List.from(map!['subtaglist']));

    return NoteDate(
        iscontent: map['iscontent'],
        issubtag: map['issubtag'],
        subtaglist: subtags,
        );
  }

  Map<String, dynamic> toJson() => {
      'iscontent': iscontent,
      'issubtag': issubtag,
      'subtaglist': subtaglist,
      };
}
