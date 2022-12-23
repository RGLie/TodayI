import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/content.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';
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

class NoteCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    List<Widget> contentWidgetList = [];
    List<Widget> contentSubtagWidgetList = [];

    for(var i = 0; i<notecontent.length; i++){
      if (!notecontent[i].issubtag) {
        if(getContentType(notecontent[i])=='content'){
          contentWidgetList.add(
            ContentNote(
              content: notecontent[i].content,
              count: notecontent[i].count,
            ),
          );
        }
        else if(getContentType(notecontent[i])=='code'){
          contentWidgetList.add(
            CodeNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='link'){
          contentWidgetList.add(
            LinkNote(
              content: notecontent[i].content,
              link: notecontent[i].link,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='property'){
          contentWidgetList.add(
            PropertyNote(
              content: notecontent[i].content,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='code-link'){
          contentWidgetList.add(
            CodeLinkNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              link: notecontent[i].link,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='code-property'){
          contentWidgetList.add(
            CodePropertyNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='link-property'){
          contentWidgetList.add(
            LinkPropertyNote(
              content: notecontent[i].content,
              link: notecontent[i].link,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='code-link-property'){
          contentWidgetList.add(
            CodePropertyLinkNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              link: notecontent[i].link,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              count: notecontent[i].count,
            )
          );
        }
      }


      else{
        if(getContentType(notecontent[i])=='subtag-content'){
          contentSubtagWidgetList.add(
            ContentNote(
              content: notecontent[i].content,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            ),
          );
        }
        else if(getContentType(notecontent[i])=='subtag-code'){
          contentSubtagWidgetList.add(
            CodeNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-link'){
          contentSubtagWidgetList.add(
            LinkNote(
              content: notecontent[i].content,
              link: notecontent[i].link,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-property'){
          contentSubtagWidgetList.add(
            PropertyNote(
              content: notecontent[i].content,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-code-link'){
          contentSubtagWidgetList.add(
            CodeLinkNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              link: notecontent[i].link,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-code-property'){
          contentSubtagWidgetList.add(
            CodePropertyNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-link-property'){
          contentSubtagWidgetList.add(
            LinkPropertyNote(
              content: notecontent[i].content,
              link: notecontent[i].link,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
        else if(getContentType(notecontent[i])=='subtag-code-link-property'){
          contentSubtagWidgetList.add(
            CodePropertyLinkNote(
              content: notecontent[i].content,
              code: notecontent[i].code,
              language: notecontent[i].language,
              link: notecontent[i].link,
              property1: notecontent[i].property1,
              property2: notecontent[i].property2,
              property3: notecontent[i].property3,
              property4: notecontent[i].property4,
              property5: notecontent[i].property5,
              cardcolor: ColorLibrary.cardSubTagColor,
              count: notecontent[i].count,
            )
          );
        }
      }
    }

    

    String data = '''
# 헤드 head 1
## 헤드 head 2
**Bold 볼드**aaaaaaaaaaaaaaaaaaaaaaayvuvuy
```dart
String hello = 'HELLO World!';
print(hello);
```
''';
    String coding = '''
SizedBox(
  height: 15,
),
''';

    
    //var hide_button_provider = Provider.of<CardNoteButtonProvider>(context);
    var card_provider = Provider.of<NoteProvider>(context);
    return InkWell(
      onTap: () {
        if (!card_provider.is_checked) {
          card_provider.checked();
          card_provider.checkedTagIdx(index);
        } else {
          if (card_provider.checked_tag == index) {
            card_provider.checked();
          } else {
            card_provider.checkedTagIdx(index);
          }
        }
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
                card_provider.checked_tag == index) {
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
                    Image(height: 60, width: 60, image: AssetImage(icon)),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('# $tagname',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 30)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(description,
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
                        card_provider.changeHide(index);
                      },
                      icon: (() {
                        if (!card_provider.getHide(index)) {
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
            if (!card_provider.getHide(index)) ...[
              SizedBox(
                height: 15,
              ),
              Container(
                color: ColorLibrary.textThemeColor,
                width: double.infinity,
                height: 2,
              ),


              // ContentNote(
              //   content: data,
              // ),
              // PropertyNote(
              //   content: '안녕하세요',
              //   property1: true,
              //   property4: true,
              // ),
              // ContentNote(
              //   content:
              //       'Provider를 이용해 Note Card 구현 완료\nEdit Note 색상 및 디자인 일부 변경',
              // ),
              // LinkPropertyNote(
              //   content: 'Pub Dev 패키지',
              //   link: 'https://pub.dev/',
              //   property1: true,
              //   property2: true,
              //   property3: true,
              // ),
              // LinkNote(link: 'https://pub.dev/', content: data),
              // CodeNote(
              //   content: 'dart 코드 입니다',
              //   code: coding,
              //   language: 'dart',
              // ),
              // CodePropertyNote(
              //   content: 'dart property 코드 입니다',
              //   code: coding,
              //   property5: true,
              // ),
              // CodeLinkNote(
              //   content: 'dart link 코드 입니다',
              //   code: coding,
              //   link: 'https://www.naver.com',
              //   language: 'dart',
              // ),
              // CodePropertyLinkNote(
              //   content: 'dart link property 코드 입니다',
              //   code: coding,
              //   link: 'https://www.naver.com',
              //   language: 'dart',
              //   property5: true,
              // ),
              SizedBox(
                height: 15,
              ),
              SubtagNote(tagtext: '에러', cardchild: [
                // ContentNote(
                //   content: '에러 내용은 이거',
                //   cardcolor: ColorLibrary.cardSubTagColor,
                // )
              ])
            ]
          ],
        ),
      ),
    );
  }

  String getContentType(NoteContent note){
    if(!note.issubtag){
      if(!note.iscode && !note.islink && !note.isproperty){
        return 'content';
      }
      else if(note.iscode && !note.islink && !note.isproperty){
        return 'code';
      }
      else if(!note.iscode && note.islink && !note.isproperty){
        return 'link';
      }
      else if(!note.iscode && !note.islink && note.isproperty){
        return 'property';
      }
      else if(note.iscode && note.islink && !note.isproperty){
        return 'code-link';
      }
      else if(note.iscode && !note.islink && note.isproperty){
        return 'code-property';
      }
      else if(!note.iscode && note.islink && note.isproperty){
        return 'link-property';
      }
      else if(note.iscode && note.islink && note.isproperty){
        return 'code-link-property';
      }
    }

    if(!note.iscode && !note.islink && !note.isproperty){
      return 'subtag-content';
    }
    else if(note.iscode && !note.islink && !note.isproperty){
      return 'subtag-code';
    }
    else if(!note.iscode && note.islink && !note.isproperty){
      return 'subtag-link';
    }
    else if(!note.iscode && !note.islink && note.isproperty){
      return 'subtag-property';
    }
    else if(note.iscode && note.islink && !note.isproperty){
      return 'subtag-code-link';
    }
    else if(note.iscode && !note.islink && note.isproperty){
      return 'subtag-code-property';
    }
    else if(!note.iscode && note.islink && note.isproperty){
      return 'subtag-link-property';
    }
    else{
      return 'subtag-code-link-property';
    }

    
  }
}
