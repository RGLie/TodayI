import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/widgets/note/show_note/content_note.dart';
import 'package:todayi/widgets/note/show_note/link_note.dart';
import 'package:todayi/widgets/note/show_note/property_note.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});


  @override
  Widget build(BuildContext context) {
      String data = '''
# 헤드 head 1
## 헤드 head 2
가나다라 abcd ABCD aaaaaaaaaaaaaaaaaaaayvuyvuy
**Bold 볼드**aaaaaaaaaaaaaaaaaaaaaaayvuvuy
''';
    var hide_button_provider = Provider.of<CardNoteButtonProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      //height: 100,
      constraints: BoxConstraints(
        maxWidth: 1000,
      ),
      decoration: BoxDecoration(
        color: ColorLibrary.cardColor,
        borderRadius: BorderRadius.circular(10),
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
                      height: 60,
                      width: 60,
                      image: AssetImage('assets/icons/write_icon.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('# Today I',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 30)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Today I 개발일지',
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
                      hide_button_provider.changeHide();
                    },
                    icon: (() {
                      if (!hide_button_provider.is_hide) {
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
          if (!hide_button_provider.is_hide) ...[
            SizedBox(
              height: 15,
            ),
            Container(
              color: ColorLibrary.textThemeColor,
              width: double.infinity,
              height: 2,
            ),
            ContentNote(
              content: data,
            ),
            PropertyNote(
              content:'안녕하세요'
            ),
            ContentNote(
              content: 'Provider를 이용해 Note Card 구현 완료\nEdit Note 색상 및 디자인 일부 변경',
            ),
          //   MarkdownBody(
          //   onTapLink: (text, href, title) {
          //     href != null ? launchUrl( Uri.parse(href)) : null;
          //   },
          //   selectable: true,
          //   data: '''Provider를 이용해 Note Card 구현 완료\nEdit Note 색상 및 디자인 일부 변경''',
          // ),
            
            LinkNote(
              link: 'https://pub.dev/',
              content:data
            ),
            SizedBox(
              height: 15,
            ),

            Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorLibrary.cardContentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        '# 에러',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorLibrary.cardSubTagColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Builder 오류 해결',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    )
                  ],
                ))
          ]
        ],
      ),
    );
  }
}
