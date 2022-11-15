import 'package:flutter/material.dart';
import 'package:todayi/pages/content_page/note/edit_note.dart';
import 'package:todayi/pages/content_page/note/show_note.dart';

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
              padding: EdgeInsets.only(left: 50, right:50, top:30, bottom:30),
              child: ShowNote(),
            ),
          )
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: double.infinity,
          color: Color(0xffFFE2B7),
          child: EditNote(),
        )
      ],
    );
  }
}