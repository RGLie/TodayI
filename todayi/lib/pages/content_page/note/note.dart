import 'package:flutter/material.dart';
import 'package:todayi/pages/content_page/note/edit_note/edit_note.dart';
import 'package:todayi/pages/content_page/note/show_note/show_note.dart';
import 'package:todayi/utils/colors.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Center(
          child: Container(
            padding:
                EdgeInsets.only(left: 200, right: 200, top: 30, bottom: 20),
            child: ShowNote(),
          ),
        )),
        Container(
          width: 515,
          height: double.infinity,
          color: ColorLibrary.editnoteColor,
          child: Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: EditNote()),
        )
      ],
    );
  }
}
