import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/edit_note/add_content_button.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    var _addButtonProvider = Provider.of<AddButtonProvider>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var user = Provider.of<TUser>(context);

    return Row(
      children: [
        MouseRegion(
          onEnter: (PointerEvent details) {
            _addButtonProvider.isCodeRegion();
          },
          onExit: (PointerEvent details) {
            _addButtonProvider.isnCodeRegion();
          },
          child: InkWell(
            onTap: () {
              _addButtonProvider.codeClicked();
              //today_note.setIsCode(true);
            },
            child: AddContentButton(
                txt: '코드 추가',
                subtxt: '개발',
                imgpath: 'assets/icons/code_icon.png',
                boxdecoration: (() {
                  if (_addButtonProvider.code_mouse_state == 1 &&
                      _addButtonProvider.is_code_clicked == 1) {
                    return BoxDecoration(
                      color: ColorLibrary.cardColorRegioned,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2.5,
                          color: ColorLibrary.textThemeColor,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 3,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ],
                    );
                  }
                  if (_addButtonProvider.code_mouse_state == 1) {
                    return BoxDecoration(
                      color: ColorLibrary.cardColorRegioned,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //     width: 2.5,
                      //     color: ColorLibrary.textThemeColor,
                      //     strokeAlign: BorderSide.strokeAlignOutside),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 3,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ],
                    );
                  }

                  if (_addButtonProvider.is_code_clicked == 1) {
                    return BoxDecoration(
                      color: ColorLibrary.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2.5,
                          color: ColorLibrary.textThemeColor,
                          strokeAlign: BorderSide.strokeAlignOutside),
                    );
                  }
                  return BoxDecoration(
                    color: ColorLibrary.cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                })()),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        MouseRegion(
          onEnter: (PointerEvent details) {
            _addButtonProvider.isLinkRegion();
          },
          onExit: (PointerEvent details) {
            _addButtonProvider.isnLinkRegion();
          },
          child: InkWell(
            onTap: () {
              _addButtonProvider.linkClicked();
            },
            child: AddContentButton(
              txt: '링크 추가',
              subtxt: '북마크',
              imgpath: 'assets/icons/badge_icon.png',
              boxdecoration: (() {
                if (_addButtonProvider.link_mouse_state == 1 &&
                    _addButtonProvider.is_link_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.link_mouse_state == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //     width: 2.5,
                    //     color: ColorLibrary.textThemeColor,
                    //     strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.is_link_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  );
                }
                return BoxDecoration(
                  color: ColorLibrary.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                );
              })(),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        MouseRegion(
          onEnter: (PointerEvent details) {
            _addButtonProvider.isPropertyRegion();
          },
          onExit: (PointerEvent details) {
            _addButtonProvider.isnPropertyRegion();
          },
          child: InkWell(
            onTap: () {
              _addButtonProvider.propertyClicked();
            },
            child: AddContentButton(
              txt: '속성 추가',
              subtxt: '배운점, 잘한점 ...',
              imgpath: 'assets/icons/email_at_icon.png',
              boxdecoration: (() {
                if (_addButtonProvider.property_mouse_state == 1 &&
                    _addButtonProvider.is_property_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.property_mouse_state == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //     width: 2.5,
                    //     color: ColorLibrary.textThemeColor,
                    //     strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.is_property_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  );
                }
                return BoxDecoration(
                  color: ColorLibrary.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                );
              })(),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        MouseRegion(
          onEnter: (PointerEvent details) {
            _addButtonProvider.isTagRegion();
          },
          onExit: (PointerEvent details) {
            _addButtonProvider.isnTagRegion();
          },
          child: InkWell(
            onTap: () {
              _addButtonProvider.tagClicked();
            },
            child: AddContentButton(
              txt: '태그 추가',
              subtxt: '서브',
              imgpath: 'assets/icons/tag_icon.png',
              boxdecoration: (() {
                if (_addButtonProvider.tag_mouse_state == 1 &&
                    _addButtonProvider.is_tag_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.tag_mouse_state == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColorRegioned,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //     width: 2.5,
                    //     color: ColorLibrary.textThemeColor,
                    //     strokeAlign: BorderSide.strokeAlignOutside),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 3,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  );
                }
                if (_addButtonProvider.is_tag_clicked == 1) {
                  return BoxDecoration(
                    color: ColorLibrary.cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5,
                        color: ColorLibrary.textThemeColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  );
                }
                return BoxDecoration(
                  color: ColorLibrary.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                );
              })(),
            ),
          ),
        ),
      ],
    );
  }
}
