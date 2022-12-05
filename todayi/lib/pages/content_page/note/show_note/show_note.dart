import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/show_note/note_card.dart';

class ShowNote extends StatefulWidget {
  const ShowNote({super.key});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    var card_provider = Provider.of<NoteProvider>(context);
    card_provider.setNumIdx(2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 70,
              image: AssetImage('assets/icons/calendar_icon.png'),
            ),
            SizedBox(
              width: 30,
            ),
            Text(DateFormat('yyyy년 MM월 dd일').format(DateTime.now()),
                style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          color: ColorLibrary.textThemeColor,
          width: double.infinity,
          height: 4,
          constraints: BoxConstraints(
            maxWidth: 1000,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  NoteCard(
                    index: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NoteCard(
                    index: 1,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
