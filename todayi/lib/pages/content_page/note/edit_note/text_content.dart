import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/edit_note/property_provider.dart';
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
  final _linkController = TextEditingController();
  final _tagController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _addButtonProvider = Provider.of<AddButtonProvider>(context);
    var _propertyProvider = Provider.of<PropertyProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if(_addButtonProvider.is_tag_clicked==1)...[
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('#',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  )
                ),
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
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      fillColor: ColorLibrary.cardColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        borderSide: BorderSide(
                            color: ColorLibrary.cardColor, width: 0),
                      ),
                      hintText: '태그를 입력하세요.',
                      //labelText: '노트를 입력하세요',
                      labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: ColorLibrary.textThemeColor, width: 2.5),
                      )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '빈칸입니다.';
                      }
                      return null;
                    },
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
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
            decoration: InputDecoration(
              fillColor: ColorLibrary.cardColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),),
                borderSide: BorderSide(
                    color: ColorLibrary.cardColor, width: 0),
              ),
              hintText: '노트를 입력하세요.',
              //labelText: '노트를 입력하세요',
              labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    color: ColorLibrary.textThemeColor, width: 2.5),
              )
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '빈칸입니다.';
              }
              return null;
            },
          ),

          

          if(_addButtonProvider.is_code_clicked==1)...[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _codeController,
              minLines: 6,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              cursorColor: ColorLibrary.textThemeColor,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
              decoration: InputDecoration(
                fillColor: ColorLibrary.codeCardColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  borderSide: BorderSide(
                      color: ColorLibrary.codeCardColor, width: 0),
                ),
                hintText: '코드를 입력하세요.',
                //labelText: '노트를 입력하세요',
                labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      color: ColorLibrary.textThemeColor, width: 2.5),
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '빈칸입니다.';
                }
                return null;
              },
            )
          ],

          

          if(_addButtonProvider.is_link_clicked==1)...[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _linkController,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.url,
              cursorColor: ColorLibrary.textThemeColor,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
              decoration: InputDecoration(
                fillColor: ColorLibrary.cardColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  borderSide: BorderSide(
                      color: ColorLibrary.cardColor, width: 0),
                ),
                hintText: '링크를 입력하세요.',
                //labelText: '노트를 입력하세요',
                labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      color: ColorLibrary.textThemeColor, width: 2.5),
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '빈칸입니다.';
                }
                return null;
              },
            )
          ],

          if(_addButtonProvider.is_property_clicked==1)...[
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
                      text: '잘함',
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
                        })()
                        
                      )
                    ),
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
                      text: '배움',
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
                        })()
                        
                      )
                    ),
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
                      text: '개선',
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
                        })()
                        
                      )
                    ),
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
                      text: '아쉬움',
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
                        })()
                        
                      )
                    ),
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
                      text: '계획',
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
                        })()
                        
                      )
                    ),
                  ),
                ),

                


              ],
            ),
          ]
        ],
      ),
    );
  }
}



