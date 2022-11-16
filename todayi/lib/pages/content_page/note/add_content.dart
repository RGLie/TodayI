import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/note/add_code_button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/edit_note/add_content_button.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    var _addCodeButtonProvider = Provider.of<AddCodeButtonProvider>(context);

    return Row(
      children: [
        MouseRegion(
          onEnter: (PointerEvent details) {
            _addCodeButtonProvider.isRegion();
          },
          onExit: (PointerEvent details) {
            _addCodeButtonProvider.isnRegion();
          },
          child: InkWell(
            onTap: () {
              _addCodeButtonProvider.clicked();
            },
            child: AddContentButton(
                txt: '코드 추가',
                subtxt: '개발',
                imgpath: 'assets/icons/code_icon.png',
                boxdecoration: (() {
                  if (_addCodeButtonProvider.mouse_state == 1) {
                    return BoxDecoration(
                      color: ColorLibrary.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5,
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
                  if (_addCodeButtonProvider.is_clicked == 1) {
                    return BoxDecoration(
                      color: ColorLibrary.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5,
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
        AddContentButton(
          txt: '링크 추가',
          subtxt: '북마크',
          imgpath: 'assets/icons/badge_icon.png',
          boxdecoration: BoxDecoration(
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
        ),
        SizedBox(
          width: 15,
        ),
        AddContentButton(
          txt: '속성 추가',
          subtxt: '배운점, 잘한점 ...',
          imgpath: 'assets/icons/email_at_icon.png',
          boxdecoration: BoxDecoration(
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
        ),
        SizedBox(
          width: 15,
        ),
        AddContentButton(
          txt: '태그 추가',
          subtxt: '서브',
          imgpath: 'assets/icons/tag_icon.png',
          boxdecoration: BoxDecoration(
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
        ),
      ],
    );
  }
}
