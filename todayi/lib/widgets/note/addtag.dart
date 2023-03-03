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
import 'package:todayi/providers/note/show_note/icon_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  final _tagController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    var note_tags = Provider.of<List<Tag>>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var icon_provider = Provider.of<IconProvider>(context);
    var rsp = Responsive(pageContext: context);
    List<Widget> addTagWidgetList = [];
    List<Widget> dialogTag = [];
    for (var i = 0; i < min(user_data.taglist.length, 4); i++) {
      addTagWidgetList.add(SizedBox(width: 10));
      addTagWidgetList.add(
        InkWell(
          onTap: () {
            for (var j = 0; j < note_tags.length; j++) {
              if (note_tags[j].tagname == user_data.taglist[i]) {
                CollectionReference selectTag = FirebaseFirestore.instance
                    .collection('users')
                    .doc(user_data.uid)
                    .collection('tags');
                if (note_tags[j].isdate == false) {
                  //FieldValue.arrayUnion([element]) DateFormat('yyyy/MM/dd').format(DateTime.now())
                  selectTag.doc(user_data.taglist[i]).update({'isdate': true});
                }

                bool flag = false;
                for (var k in note_tags[j].datelist) {
                  if (k == today_note.today_date) {
                    flag = true;
                  }
                }
                if (!flag) {
                  selectTag.doc(user_data.taglist[i]).update({
                    'datelist': FieldValue.arrayUnion([today_note.today_date])
                  });
                }
              }
            }
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
                              style: TextStyle(
                                  color: ColorLibrary.textThemeColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        //
                        content: SizedBox(
                          width: 300,
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                      controller: _tagController,
                                      minLines: 1,
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: ColorLibrary.textThemeColor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                          fillColor: ColorLibrary.cardColor,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            borderSide: BorderSide(
                                                color: ColorLibrary.cardColor,
                                                width: 0),
                                          ),
                                          hintText: '태그를 입력하세요.',
                                          //labelText: '노트를 입력하세요',
                                          labelStyle: TextStyle(
                                              color:
                                                  ColorLibrary.textThemeColor),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: BorderSide(
                                                color:
                                                    ColorLibrary.textThemeColor,
                                                width: 2.5),
                                          )),
                                      validator: (value) {
                                        //띄워쓰기 처리 해야함
                                        if (value!.isEmpty) {
                                          return '태그를 입력하세요.';
                                        }
                                        if (value.contains(' ')) {
                                          return '공백은 지원되지 않습니다.';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      controller: _descriptionController,
                                      minLines: 3,
                                      maxLines: 3,
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: ColorLibrary.textThemeColor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                          fillColor: ColorLibrary.cardColor,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            borderSide: BorderSide(
                                                color: ColorLibrary.cardColor,
                                                width: 0),
                                          ),
                                          hintText: '설명을 입력하세요.',
                                          //labelText: '노트를 입력하세요',
                                          labelStyle: TextStyle(
                                              color:
                                                  ColorLibrary.textThemeColor),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: BorderSide(
                                                color:
                                                    ColorLibrary.textThemeColor,
                                                width: 2.5),
                                          )),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '설명을 입력하세요';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  (() {
                                    if (icon_provider.icon_clicked) {
                                      return Column(
                                        children: [
                                          Text(
                                            '아이콘을 선택해주세요',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      );
                                    }
                                    return SizedBox(
                                      height: 5,
                                    );
                                  })(),
                                  Container(
                                    width: 300,
                                    height: 250,
                                    child: GridView.builder(
                                        itemCount: 50,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5,
                                                childAspectRatio: 1,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              icon_provider.checked();
                                              icon_provider.clickedChecked();
                                              icon_provider.iconChecked(index);
                                            },
                                            child: Image(
                                              width: 50,
                                              image: AssetImage(
                                                  'assets/icons/${(index + 1).toString()}.png'),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: new Text("생성"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorLibrary.textThemeColor),
                            onPressed: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              if (icon_provider.icon_checked) {
                                if (_formKey.currentState!.validate()) {
                                  CollectionReference users = FirebaseFirestore
                                      .instance
                                      .collection('users');
                                  CollectionReference tags = FirebaseFirestore
                                      .instance
                                      .collection('users')
                                      .doc(user_data.uid)
                                      .collection('tags');
                                  users.doc(user_data.uid).update({
                                    'taglist': FieldValue.arrayUnion(
                                        [_tagController.text])
                                  });
                                  Tag newTag = Tag(
                                      uid: user_data.uid,
                                      username: user_data.name,
                                      tagname: _tagController.text,
                                      createdate: today_note.today_date,
                                      description: _descriptionController.text,
                                      icon: 'assets/icons/${(icon_provider.icon + 1).toString()}.png',
                                      issubtag: false,
                                      subtaglist: [],
                                      isdate: false,
                                      datelist: []);
                                  tags
                                      .doc(_tagController.text)
                                      .set(newTag.toJson());
                                  Navigator.pop(context);
                                }
                              } else {
                                icon_provider.buttonChecked();
                              }
                            },
                          ),
                          ElevatedButton(
                            child: new Text("닫기"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent),
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
