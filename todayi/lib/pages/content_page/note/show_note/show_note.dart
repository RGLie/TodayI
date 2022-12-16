import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/note.dart';
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
  DataProvider db = DataProvider();
  @override
  Widget build(BuildContext context) {
    var noteDataList = Provider.of<List<Note>>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var userData = Provider.of<TUser>(context);
    int todaynum = 0;
    List<Widget> noteCardList = [];

    for (int i = 0; i < noteDataList.length; i++) {
      for (var j = 0; j < noteDataList[i].datelist.length; j++) {
        if (noteDataList[i].datelist[j] == today_note.today_date) {
          noteCardList.add(
            StreamProvider.value(
              value: db.getDateCollection(userData.uid, noteDataList[i].tagname, noteDataList[i].datelist[j]),
              initialData: null,
              child: NoteCard(
                index: i,
                tagname: noteDataList[i].tagname,
                description: noteDataList[i].description,
                icon: noteDataList[i].icon,
              ),
          ));
          noteCardList.add(SizedBox(
            height: 20,
          ));
          todaynum += 1;
        }
      }
    }
    today_note.setNumIdx(todaynum);

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
