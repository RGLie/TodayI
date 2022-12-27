import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/content.dart';
import 'package:todayi/data/date.dart';
import 'package:todayi/data/tag.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/data_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/addtag.dart';
import 'package:todayi/widgets/note/show_note/note_card.dart';

class ShowNote extends StatefulWidget {
  const ShowNote({super.key});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  //DataProvider db = DataProvider();


  @override
  Widget build(BuildContext context) {
    var noteDataList = Provider.of<List<Tag>>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var userData = Provider.of<TUser>(context);
    var noteContentList = Provider.of<List<NoteContent>>(context);

    int todaynum = 0;
    List<Widget> noteCardList = [];

    for (int i = 0; i < noteDataList.length; i++) {
      for (var j = 0; j < noteDataList[i].datelist.length; j++) {
        if (noteDataList[i].datelist[j] == today_note.today_date) {
          List<NoteContent> todayTagContentList = [];
          for (var k = 0; k < noteContentList.length; k++) {
            if (noteContentList[k].contentdate == today_note.today_date &&
                noteContentList[k].tag == noteDataList[i].tagname) {
              todayTagContentList.add(noteContentList[k]);
            }
          }
          //today_note.addTag(noteDataList[i]);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            var today_note2 = Provider.of<NoteProvider>(context);
              today_note2.addTag(noteDataList[i]);
          });
          noteCardList.add(
            NoteCard(
              index: i,
              tagname: noteDataList[i].tagname,
              description: noteDataList[i].description,
              icon: noteDataList[i].icon,
              notecontent: todayTagContentList,
            ),
          );
          noteCardList.add(SizedBox(
            height: 20,
          ));
          //todaynum += 1;
        }
      }
    }
    //today_note.setNumIdx(todaynum);

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
          height: 10,
        ),
        AddTag(),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: noteCardList),
            ),
          ),
        )
      ],
    );
  }
}
