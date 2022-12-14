import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/content.dart';
import 'package:todayi/data/tag.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';
import 'package:todayi/providers/note/show_note/icon_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/show_note/code_link_note.dart';
import 'package:todayi/widgets/note/show_note/code_link_property.dart';
import 'package:todayi/widgets/note/show_note/code_note.dart';
import 'package:todayi/widgets/note/show_note/code_property.dart';
import 'package:todayi/widgets/note/show_note/content_note.dart';
import 'package:todayi/widgets/note/show_note/link_note.dart';
import 'package:todayi/widgets/note/show_note/link_property_note.dart';
import 'package:todayi/widgets/note/show_note/property_note.dart';
import 'package:todayi/widgets/note/show_note/subtag/subtag_note.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteCard extends StatefulWidget {
  int index;
  String tagname;
  String description;
  String icon;
  List<NoteContent> notecontent;

  NoteCard({
    super.key,
    required this.index,
    required this.tagname,
    required this.description,
    required this.icon,
    required this.notecontent,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final _tagController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    //var today_note = Provider.of<NoteProvider>(context);
    var icon_provider = Provider.of<IconProvider>(context);
    List<Widget> contentWidgetList = [];

    Map<String, dynamic> subtagWidgets = {};

    for (var i = 0; i < widget.notecontent.length; i++) {
      if (widget.notecontent[i].issubtag) {
        subtagWidgets[widget.notecontent[i].subtag] = [];
      }
    }

    for (var i = 0; i < widget.notecontent.length; i++) {
      if (!widget.notecontent[i].issubtag) {
        if (getContentType(widget.notecontent[i]) == 'content') {
          contentWidgetList.add(
            ContentNote(
              content: widget.notecontent[i].content,
              count: widget.notecontent[i].count,
            ),
          );
        } else if (getContentType(widget.notecontent[i]) == 'code') {
          contentWidgetList.add(CodeNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'link') {
          contentWidgetList.add(LinkNote(
            content: widget.notecontent[i].content,
            link: widget.notecontent[i].link,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'property') {
          contentWidgetList.add(PropertyNote(
            content: widget.notecontent[i].content,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'code-link') {
          contentWidgetList.add(CodeLinkNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            link: widget.notecontent[i].link,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'code-property') {
          contentWidgetList.add(CodePropertyNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'link-property') {
          contentWidgetList.add(LinkPropertyNote(
            content: widget.notecontent[i].content,
            link: widget.notecontent[i].link,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) ==
            'code-link-property') {
          contentWidgetList.add(CodePropertyLinkNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            link: widget.notecontent[i].link,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            count: widget.notecontent[i].count,
          ));
        }
      } else {
        if (getContentType(widget.notecontent[i]) == 'subtag-content') {
          subtagWidgets[widget.notecontent[i].subtag].add(
            ContentNote(
              content: widget.notecontent[i].content,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: widget.notecontent[i].count,
            ),
          );
        } else if (getContentType(widget.notecontent[i]) == 'subtag-code') {
          subtagWidgets[widget.notecontent[i].subtag].add(CodeNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'subtag-link') {
          subtagWidgets[widget.notecontent[i].subtag].add(LinkNote(
            content: widget.notecontent[i].content,
            link: widget.notecontent[i].link,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) == 'subtag-property') {
          subtagWidgets[widget.notecontent[i].subtag].add(PropertyNote(
            content: widget.notecontent[i].content,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) ==
            'subtag-code-link') {
          subtagWidgets[widget.notecontent[i].subtag].add(CodeLinkNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            link: widget.notecontent[i].link,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) ==
            'subtag-code-property') {
          subtagWidgets[widget.notecontent[i].subtag].add(CodePropertyNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) ==
            'subtag-link-property') {
          subtagWidgets[widget.notecontent[i].subtag].add(LinkPropertyNote(
            content: widget.notecontent[i].content,
            link: widget.notecontent[i].link,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        } else if (getContentType(widget.notecontent[i]) ==
            'subtag-code-link-property') {
          subtagWidgets[widget.notecontent[i].subtag].add(CodePropertyLinkNote(
            content: widget.notecontent[i].content,
            code: widget.notecontent[i].code,
            language: widget.notecontent[i].language,
            link: widget.notecontent[i].link,
            property1: widget.notecontent[i].property1,
            property2: widget.notecontent[i].property2,
            property3: widget.notecontent[i].property3,
            property4: widget.notecontent[i].property4,
            property5: widget.notecontent[i].property5,
            cardcolor: ColorLibrary.cardSubTagColor,
            count: widget.notecontent[i].count,
          ));
        }
      }
    }

    List<Widget> contentSubtagWidgetList = [];
    List<Widget> subtagContents = [];
    for (var i in subtagWidgets.keys) {
      subtagContents = [];
      if (subtagWidgets[i].length != 0) {
        for (var j in subtagWidgets[i]) {
          subtagContents.add(j);
        }
        contentSubtagWidgetList.add(SizedBox(height: 15));
        contentSubtagWidgetList
            .add(SubtagNote(cardchild: subtagContents, tagtext: i));
      }
    }

    //var hide_button_provider = Provider.of<CardNoteButtonProvider>(context);
    var card_provider = Provider.of<NoteProvider>(context);
    return InkWell(
      onTap: () {
        if (!card_provider.is_checked) {
          card_provider.checked();
          card_provider.checkedTagIdx(widget.index);
        } else {
          if (card_provider.checked_tag == widget.index) {
            card_provider.checked();
          } else {
            card_provider.checkedTagIdx(widget.index);
          }
        }
      },
      onLongPress: () {
        icon_provider.reset();
        _descriptionController.text = card_provider.tag_list[widget.index].description;
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
                  "?????? ?????? ??????",
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
                      Text('# '+card_provider.tag_list[widget.index].tagname,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
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
                              hintText: '????????? ???????????????.',
                              //suffixText: card_provider.tag_list[widget.index].description,
                              //labelText: '????????? ???????????????',
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
                              return '????????? ???????????????';
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
                                '???????????? ??????????????????',
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
                child: new Text("??????"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorLibrary.textThemeColor),
                onPressed: () {
                  FocusScope.of(context)
                      .requestFocus(new FocusNode());
                  if (icon_provider.icon_checked) {
                    if (_formKey.currentState!.validate()) {
                      CollectionReference tags = FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc(user_data.uid)
                          .collection('tags');
                      
                      tags.doc(card_provider.tag_list[widget.index].tagname).update({
                        'description': _descriptionController.text,
                        'icon': 'assets/icons/${(icon_provider.icon + 1).toString()}.png',
                      });
                      Navigator.pop(context);
                    }
                  } else {
                    icon_provider.buttonChecked();
                  }
                },
              ),
              ElevatedButton(
                child: new Text("??????"),
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
        padding: EdgeInsets.all(15),
        width: double.infinity,
        //height: 100,
        constraints: BoxConstraints(
          maxWidth: 1000,
        ),
        decoration: BoxDecoration(
          color: ColorLibrary.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: (() {
            if (card_provider.is_checked &&
                card_provider.checked_tag == widget.index) {
              return Border.all(
                  width: 3,
                  color: ColorLibrary.textThemeColor,
                  strokeAlign: BorderSide.strokeAlignOutside);
            }
          })(),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 5,
              offset: Offset(3, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                        height: 60, width: 60, image: AssetImage(widget.icon)),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('# ${widget.tagname}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 30)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(widget.description,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                Material(
                  color: ColorLibrary.cardColor,
                  child: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        card_provider.changeHide(widget.index);
                      },
                      icon: (() {
                        if (!card_provider.getHide(widget.index)) {
                          return Icon(
                            Icons.expand_less,
                            color: Colors.black54,
                          );
                        }
                        return Icon(
                          Icons.expand_more,
                          color: Colors.black54,
                        );
                      })()),
                )
              ],
            ),
            if (!card_provider.getHide(widget.index)) ...[
              SizedBox(
                height: 15,
              ),
              Container(
                color: ColorLibrary.textThemeColor,
                width: double.infinity,
                height: 2,
              ),
              Column(children: contentWidgetList),
              Column(
                children: contentSubtagWidgetList,
              )
              // ContentNote(
              //   content: data,
              // ),
              // PropertyNote(
              //   content: '???????????????',
              //   property1: true,
              //   property4: true,
              // ),
              // ContentNote(
              //   content:
              //       'Provider??? ????????? Note Card ?????? ??????\nEdit Note ?????? ??? ????????? ?????? ??????',
              // ),
              // LinkPropertyNote(
              //   content: 'Pub Dev ?????????',
              //   link: 'https://pub.dev/',
              //   property1: true,
              //   property2: true,
              //   property3: true,
              // ),
              // LinkNote(link: 'https://pub.dev/', content: data),
              // CodeNote(
              //   content: 'dart ?????? ?????????',
              //   code: coding,
              //   language: 'dart',
              // ),
              // CodePropertyNote(
              //   content: 'dart property ?????? ?????????',
              //   code: coding,
              //   property5: true,
              // ),
              // CodeLinkNote(
              //   content: 'dart link ?????? ?????????',
              //   code: coding,
              //   link: 'https://www.naver.com',
              //   language: 'dart',
              // ),
              // CodePropertyLinkNote(
              //   content: 'dart link property ?????? ?????????',
              //   code: coding,
              //   link: 'https://www.naver.com',
              //   language: 'dart',
              //   property5: true,
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // SubtagNote(tagtext: '??????', cardchild: [
              //   // ContentNote(
              //   //   content: '?????? ????????? ??????',
              //   //   cardcolor: ColorLibrary.cardSubTagColor,
              //   // )
              // ])
            ]
          ],
        ),
      ),
    );
  }

  String getContentType(NoteContent note) {
    if (!note.issubtag) {
      if (!note.iscode && !note.islink && !note.isproperty) {
        return 'content';
      } else if (note.iscode && !note.islink && !note.isproperty) {
        return 'code';
      } else if (!note.iscode && note.islink && !note.isproperty) {
        return 'link';
      } else if (!note.iscode && !note.islink && note.isproperty) {
        return 'property';
      } else if (note.iscode && note.islink && !note.isproperty) {
        return 'code-link';
      } else if (note.iscode && !note.islink && note.isproperty) {
        return 'code-property';
      } else if (!note.iscode && note.islink && note.isproperty) {
        return 'link-property';
      } else if (note.iscode && note.islink && note.isproperty) {
        return 'code-link-property';
      }
    }

    if (!note.iscode && !note.islink && !note.isproperty) {
      return 'subtag-content';
    } else if (note.iscode && !note.islink && !note.isproperty) {
      return 'subtag-code';
    } else if (!note.iscode && note.islink && !note.isproperty) {
      return 'subtag-link';
    } else if (!note.iscode && !note.islink && note.isproperty) {
      return 'subtag-property';
    } else if (note.iscode && note.islink && !note.isproperty) {
      return 'subtag-code-link';
    } else if (note.iscode && !note.islink && note.isproperty) {
      return 'subtag-code-property';
    } else if (!note.iscode && note.islink && note.isproperty) {
      return 'subtag-link-property';
    } else {
      return 'subtag-code-link-property';
    }
  }
}
