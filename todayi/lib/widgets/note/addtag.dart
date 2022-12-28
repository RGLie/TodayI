import 'dart:html';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/date.dart';
import 'package:todayi/data/tag.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/colors.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    var note_tags = Provider.of<List<Tag>>(context);
    var today_note = Provider.of<NoteProvider>(context);
    List<Widget> addTagWidgetList = [];
    List<Widget> dialogTag = [];
    for (var i = 0; i < min(user_data.taglist.length, 4); i++) {
      addTagWidgetList.add(SizedBox(width: 10));
      addTagWidgetList.add(
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: ColorLibrary.cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 3,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
            ),
            child: Center(
                child: Text(
              '# ' +
                  (user_data.taglist[i].length > 8
                      ? user_data.taglist[i].substring(0, 8) + '...'
                      : user_data.taglist[i]),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            )),
          ),
        ),
      );
    }

    for (var i in user_data.taglist) {
      dialogTag.add(InkWell(
        onTap: () {
          //print(note_tags.length);
          for (var j = 0; j < note_tags.length; j++) {
            if (note_tags[j].tagname == i) {
              CollectionReference selectTag = FirebaseFirestore.instance
                  .collection('users')
                  .doc(user_data.uid)
                  .collection('tags');
              if (note_tags[j].isdate == false) {
                //FieldValue.arrayUnion([element]) DateFormat('yyyy/MM/dd').format(DateTime.now())
                selectTag.doc(i).update({'isdate': true});
              }

              bool flag = false;
              for (var k in note_tags[j].datelist) {
                if (k == today_note.today_date) {
                  flag = true;
                }
              }
              if (!flag) {
                selectTag.doc(i).update({
                  'datelist': FieldValue.arrayUnion([today_note.today_date])
                });

                // WidgetsBinding.instance.addPostFrameCallback((_){
                //   //var today_note2 = Provider.of<NoteProvider>(context);
                //   today_note.addTagNotify(note_tags[j]);
                // }); 
                //today_note.addTag(note_tags[j]);

                
                //today_note.setNumIdx(today_note.tag_list.length);
              }
              Navigator.pop(context);
            }
          }
        },
        child: Container(
          width: double.infinity,
          height: 30,
          child: Center(
            child: Text(
              '# ' + i,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ));
      dialogTag.add(SizedBox(
        height: 5,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: <Widget>[
                            new Text(
                              "노트 태그 추가",
                              style:
                                  TextStyle(color: ColorLibrary.textThemeColor),
                            ),
                          ],
                        ),
                        //
                        content: SizedBox(
                          height: 200,
                          width: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              children: dialogTag,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          new ElevatedButton(
                            child: new Text("닫기"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorLibrary.textThemeColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                height: 35,
                padding: EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  color: ColorLibrary.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  '태그 추가',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15),
                )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: <Widget>[
                            new Text(
                              "노트 태그 생성",
                              style:
                                  TextStyle(color: ColorLibrary.textThemeColor),
                            ),
                          ],
                        ),
                        //
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("가입이 완료되었습니다.",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        actions: <Widget>[
                          new ElevatedButton(
                            child: new Text("확인"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorLibrary.textThemeColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                height: 35,
                padding: EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  color: ColorLibrary.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  '태그 생성',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15),
                )),
              ),
            ),
          ],
        ),
        Row(children: addTagWidgetList)
      ],
    );
  }
}
