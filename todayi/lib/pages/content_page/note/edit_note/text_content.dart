import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/content.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/edit_note/property_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/edit_note/property_button.dart';

class TextContent extends StatefulWidget {
  const TextContent({super.key});

  @override
  State<TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  final _textController = TextEditingController();
  final _codeController = TextEditingController();
  final _lanController = TextEditingController();
  final _linkController = TextEditingController();
  final _tagController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _addButtonProvider = Provider.of<AddButtonProvider>(context);
    var _propertyProvider = Provider.of<PropertyProvider>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var userData = Provider.of<TUser>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (_addButtonProvider.is_tag_clicked == 1) ...[
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('#',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 45,
                  width: 190,
                  child: TextFormField(
                    controller: _tagController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    cursorColor: ColorLibrary.textThemeColor,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        fillColor: ColorLibrary.cardColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              color: ColorLibrary.cardColor, width: 0),
                        ),
                        hintText: '????????? ???????????????.',
                        //labelText: '????????? ???????????????',
                        labelStyle:
                            TextStyle(color: ColorLibrary.textThemeColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: ColorLibrary.textThemeColor, width: 2.5),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
          TextFormField(
            controller: _textController,
            minLines: 4,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            cursorColor: ColorLibrary.textThemeColor,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                fillColor: ColorLibrary.cardColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide:
                      BorderSide(color: ColorLibrary.cardColor, width: 0),
                ),
                hintText: '????????? ???????????????. (????????????)',
                //labelText: '????????? ???????????????',
                labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      color: ColorLibrary.textThemeColor, width: 2.5),
                )),
          ),
          if (_addButtonProvider.is_code_clicked == 1) ...[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _lanController,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              cursorColor: ColorLibrary.textThemeColor,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  fillColor: ColorLibrary.codeCardColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide:
                        BorderSide(color: ColorLibrary.codeCardColor, width: 0),
                  ),
                  hintText: '?????? ????????? ???????????????.',
                  //labelText: '????????? ???????????????',
                  labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: ColorLibrary.textThemeColor, width: 2.5),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _codeController,
              minLines: 6,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              cursorColor: ColorLibrary.textThemeColor,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  fillColor: ColorLibrary.codeCardColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide:
                        BorderSide(color: ColorLibrary.codeCardColor, width: 0),
                  ),
                  hintText: '????????? ???????????????.',
                  //labelText: '????????? ???????????????',
                  labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: ColorLibrary.textThemeColor, width: 2.5),
                  )),
            ),
          ],
          if (_addButtonProvider.is_link_clicked == 1) ...[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _linkController,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.url,
              cursorColor: ColorLibrary.textThemeColor,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  fillColor: ColorLibrary.cardColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide:
                        BorderSide(color: ColorLibrary.cardColor, width: 0),
                  ),
                  hintText: '????????? ???????????????.',
                  //labelText: '????????? ???????????????',
                  labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: ColorLibrary.textThemeColor, width: 2.5),
                  )),
            )
          ],
          if (_addButtonProvider.is_property_clicked == 1) ...[
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                MouseRegion(
                  onEnter: (PointerEvent details) {
                    _propertyProvider.istypeARegion();
                  },
                  onExit: (PointerEvent details) {
                    _propertyProvider.isntypeARegion();
                  },
                  child: InkWell(
                    onTap: () {
                      _propertyProvider.typeAClicked();
                    },
                    child: PropertyButton(
                        text: '??????',
                        boxdecoration: BoxDecoration(
                            color: (() {
                              if (_propertyProvider.typeA_mouse_state == 1) {
                                return ColorLibrary.cardColorRegioned;
                              }
                              return ColorLibrary.cardColor;
                            })(),
                            borderRadius: BorderRadius.circular(20),
                            border: (() {
                              if (_propertyProvider.is_typeA_clicked == 1) {
                                return Border.all(
                                    width: 2.5,
                                    color: ColorLibrary.textThemeColor,
                                    strokeAlign: BorderSide.strokeAlignOutside);
                              }
                              return null;
                            })())),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                MouseRegion(
                  onEnter: (PointerEvent details) {
                    _propertyProvider.istypeBRegion();
                  },
                  onExit: (PointerEvent details) {
                    _propertyProvider.isntypeBRegion();
                  },
                  child: InkWell(
                    onTap: () {
                      _propertyProvider.typeBClicked();
                    },
                    child: PropertyButton(
                        text: '??????',
                        boxdecoration: BoxDecoration(
                            color: (() {
                              if (_propertyProvider.typeB_mouse_state == 1) {
                                return ColorLibrary.cardColorRegioned;
                              }
                              return ColorLibrary.cardColor;
                            })(),
                            borderRadius: BorderRadius.circular(20),
                            border: (() {
                              if (_propertyProvider.is_typeB_clicked == 1) {
                                return Border.all(
                                    width: 2.5,
                                    color: ColorLibrary.textThemeColor,
                                    strokeAlign: BorderSide.strokeAlignOutside);
                              }
                              return null;
                            })())),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                MouseRegion(
                  onEnter: (PointerEvent details) {
                    _propertyProvider.istypeCRegion();
                  },
                  onExit: (PointerEvent details) {
                    _propertyProvider.isntypeCRegion();
                  },
                  child: InkWell(
                    onTap: () {
                      _propertyProvider.typeCClicked();
                    },
                    child: PropertyButton(
                        text: '??????',
                        boxdecoration: BoxDecoration(
                            color: (() {
                              if (_propertyProvider.typeC_mouse_state == 1) {
                                return ColorLibrary.cardColorRegioned;
                              }
                              return ColorLibrary.cardColor;
                            })(),
                            borderRadius: BorderRadius.circular(20),
                            border: (() {
                              if (_propertyProvider.is_typeC_clicked == 1) {
                                return Border.all(
                                    width: 2.5,
                                    color: ColorLibrary.textThemeColor,
                                    strokeAlign: BorderSide.strokeAlignOutside);
                              }
                              return null;
                            })())),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                MouseRegion(
                  onEnter: (PointerEvent details) {
                    _propertyProvider.istypeDRegion();
                  },
                  onExit: (PointerEvent details) {
                    _propertyProvider.isntypeDRegion();
                  },
                  child: InkWell(
                    onTap: () {
                      _propertyProvider.typeDClicked();
                    },
                    child: PropertyButton(
                        text: '?????????',
                        boxdecoration: BoxDecoration(
                            color: (() {
                              if (_propertyProvider.typeD_mouse_state == 1) {
                                return ColorLibrary.cardColorRegioned;
                              }
                              return ColorLibrary.cardColor;
                            })(),
                            borderRadius: BorderRadius.circular(20),
                            border: (() {
                              if (_propertyProvider.is_typeD_clicked == 1) {
                                return Border.all(
                                    width: 2.5,
                                    color: ColorLibrary.textThemeColor,
                                    strokeAlign: BorderSide.strokeAlignOutside);
                              }
                              return null;
                            })())),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                MouseRegion(
                  onEnter: (PointerEvent details) {
                    _propertyProvider.istypeERegion();
                  },
                  onExit: (PointerEvent details) {
                    _propertyProvider.isntypeERegion();
                  },
                  child: InkWell(
                    onTap: () {
                      _propertyProvider.typeEClicked();
                    },
                    child: PropertyButton(
                        text: '??????',
                        boxdecoration: BoxDecoration(
                            color: (() {
                              if (_propertyProvider.typeE_mouse_state == 1) {
                                return ColorLibrary.cardColorRegioned;
                              }
                              return ColorLibrary.cardColor;
                            })(),
                            borderRadius: BorderRadius.circular(20),
                            border: (() {
                              if (_propertyProvider.is_typeE_clicked == 1) {
                                return Border.all(
                                    width: 2.5,
                                    color: ColorLibrary.textThemeColor,
                                    strokeAlign: BorderSide.strokeAlignOutside);
                              }
                              return null;
                            })())),
                  ),
                ),
              ],
            ),
          ],
          SizedBox(
            height: 15,
          ),
          MouseRegion(
            onEnter: (PointerEvent details) {
              _addButtonProvider.isEnterRegion();
            },
            onExit: (PointerEvent details) {
              _addButtonProvider.isnEnterRegion();
            },
            child: InkWell(
              onTap: () {
                _addButtonProvider.enterClicked();
                FocusScope.of(context).requestFocus(new FocusNode());
                if (_formKey.currentState!.validate()) {
                  if (today_note.is_checked) {
                    String ContentID = _addButtonProvider.is_tag_clicked==1 ?
                      today_note.getChekcedTag().tagname+'.'+_tagController.text 
                      + '?' + today_note.today_date 
                      + '?' + userData.count.toString() :
                      today_note.getChekcedTag().tagname 
                      + '?' + today_note.today_date 
                      + '?' + userData.count.toString();
                    //_codeContoller.text
                    CollectionReference contents = FirebaseFirestore.instance
                        .collection('users')
                        .doc(userData.uid)
                        .collection('contents');
                    NoteContent newcontent = NoteContent(
                      uid: userData.uid,
                      tag: today_note.getChekcedTag().tagname,
                      contentdate: today_note.today_date,
                      lastupdatedate: today_note.today_date,
                      iscode: _addButtonProvider.is_code_clicked==1,
                      islink: _addButtonProvider.is_link_clicked==1,
                      isproperty: _addButtonProvider.is_property_clicked==1,
                      issubtag: _addButtonProvider.is_tag_clicked==1,
                      property1: _propertyProvider.is_typeA_clicked==1,
                      property2: _propertyProvider.is_typeB_clicked==1,
                      property3: _propertyProvider.is_typeC_clicked==1,
                      property4: _propertyProvider.is_typeD_clicked==1,
                      property5: _propertyProvider.is_typeE_clicked==1,
                      content: _textController.text,
                      code: _addButtonProvider.is_code_clicked==1?_codeController.text:'',
                      language: _addButtonProvider.is_code_clicked==1?_lanController.text:'',
                      link: _addButtonProvider.is_link_clicked==1?_linkController.text:'',
                      subtag: _addButtonProvider.is_tag_clicked==1?_tagController.text:'',
                      count: userData.count,
                      contentid: ContentID
                    );
                    contents.doc(ContentID).set(newcontent.toJson());
                    CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
                    userCollection..doc(userData.uid).update({'count': FieldValue.increment(1)});
                    
                    //today_note.plusCount();
                    
                    if(_addButtonProvider.is_tag_clicked==1){
                      CollectionReference selectTag = FirebaseFirestore.instance
                        .collection('users')
                        .doc(userData.uid)
                        .collection('tags');
                      selectTag.doc(today_note.getChekcedTag().tagname).update({
                        'subtaglist': FieldValue.arrayUnion([_tagController.text])
                      });
                      selectTag.doc(today_note.getChekcedTag().tagname).update({
                        'issubtag': true
                      });
                    }
                    _textController.clear();
                    _tagController.clear();
                    _codeController.clear();
                    _linkController.clear();
                    _lanController.clear();
                  }
                  else{
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
                              new Text("??????", style: TextStyle(color: Colors.redAccent),),
                            ],
                          ),
                          //
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "????????? ????????? ????????? ??????????????????.",
                                style: TextStyle(color: Colors.black)
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            new ElevatedButton(
                              child: new Text("??????"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorLibrary.textThemeColor
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      }
                    );   
                  }


                }
              },
              child: (() {
                switch (_addButtonProvider.enter_mouse_state) {
                  case 1:
                    return Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorLibrary.textThemeColor,
                        //boxShadow: boxShadows,
                      ),
                      child: Center(
                          child: Text(
                        '??????',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                    );
                }
                return Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.5, color: ColorLibrary.textThemeColor),
                    borderRadius: BorderRadius.circular(10),
                    //boxShadow: boxShadows,
                  ),
                  child: Center(
                      child: Text(
                    '??????',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                );
              })(),
            ),
          ),
          
        ],
      ),
    );
  }
}
