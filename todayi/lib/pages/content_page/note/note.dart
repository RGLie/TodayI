import 'package:flutter/material.dart';
import 'package:todayi/pages/content_page/note/edit_note/edit_note.dart';
import 'package:todayi/pages/content_page/note/show_note/show_note.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    var rsp = Responsive(pageContext: context);
    return Row(
      children: [
        Expanded(
            child: Center(
          child: Container(
            padding:
                EdgeInsets.only(left: rsp.rspWidth(200), right: rsp.rspWidth(200), top: rsp.rspHeight(30), bottom: rsp.rspHeight(20)),
            child: ShowNote(),
          ),
        )),
        Container(
          width: rsp.rspWidth(515),
          height: double.infinity,
          color: ColorLibrary.editnoteColor,
          child: Container(
              padding:
                  EdgeInsets.only(left: rsp.rspWidth(15), right: rsp.rspWidth(15), top: rsp.rspHeight(15), bottom: rsp.rspHeight(15)),
              child: EditNote()),
        )
      ],
    );
  }
}
