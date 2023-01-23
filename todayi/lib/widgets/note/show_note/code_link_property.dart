import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/code_element.dart';
import 'package:todayi/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CodePropertyLinkNote extends StatelessWidget {
  String content;
  String code;
  String language;
  String link;
  int count;
  String subtag;
  String tagname;
  bool property1;
  bool property2;
  bool property3;
  bool property4;
  bool property5;
  Color cardcolor;

  CodePropertyLinkNote({
    super.key,
    required this.content,
    required this.code,
    required this.link,
    required this.count,
    required this.tagname,
    this.subtag = '',
    this.language='dart',
    this.property1 = false,
    this.property2 = false,
    this.property3 = false,
    this.property4 = false,
    this.property5 = false,
    this.cardcolor = const Color(0xffe0d1ba)
  });

  @override
  Widget build(BuildContext context) {
    String codeblock = '```$language\n$code';
    String txt = '';
    var user_data = Provider.of<TUser>(context);
    var today_note = Provider.of<NoteProvider>(context);
    String contentID = subtag==''?
      tagname + '?' + today_note.today_date + '?' + count.toString()
      :tagname + '.'+ subtag+'?' + today_note.today_date + '?' + count.toString();
    

    if (property1) {
      txt = txt + '@ 잘함   ';
    }
    if (property2) {
      txt = txt + '@ 배움   ';
    }
    if (property3) {
      txt = txt + '@ 개선   ';
    }
    if (property4) {
      txt = txt + '@ 아쉬움   ';
    }
    if (property5) {
      txt = txt + '@ 계획   ';
    }
    
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Dismissible(
          key: Key(contentID),
            background: Container(
              
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,

                  )
                ),
              ),
            ),
            onDismissed: (direction) {

              CollectionReference contents = FirebaseFirestore.instance
                .collection('users')
                .doc(user_data.uid)
                .collection('contents');
              
              contents.doc(contentID).delete();

              Fluttertoast.showToast(msg: '삭제 되었습니다.',
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.white,
                webBgColor: "linear-gradient(to right, #3A2000, #3A2000)",
                webPosition: 'center',
                
                fontSize: 20.0,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT
              );
            },
          direction: DismissDirection.endToStart,
          child: InkWell(
            onLongPress: () {
              launchUrl(
                Uri.parse(link),
              );
            },
            onTap: () {
              Fluttertoast.showToast(msg: '링크를 들어가기 위해 꾹 눌러주세요.',
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.white,
                webBgColor: "linear-gradient(to right, #3A2000, #3A2000)",
                webPosition: 'center',
                
                fontSize: 20.0,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT
              );
            },
            child: Container(
              padding: EdgeInsets.only( top: 15, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: MarkdownBody(
                        onTapLink: (text, href, title) {
                          href != null ? launchUrl(Uri.parse(href)) : null;
                        },
                        selectable: true,
                        data: content,
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                          h4: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          h3: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                          h2: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                          h1: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                          // code: TextStyle(
                          //   backgroundColor: Colors.black,
                          //   color: Colors.white,
                          //   fontSize: 16
                  
                          // )
                        ),
                        key: const Key("defaultmarkdownformatter"),
                        builders: {
                          'code': CodeElementBuilder(),
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Color(0xff282c34),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                      child: MarkdownBody(
                          onTapLink: (text, href, title) {
                            href != null ? launchUrl(Uri.parse(href)) : null;
                          },
                          selectable: true,
                          data: codeblock,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                            h4: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                            h3: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                            h2: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                            h1: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 28),
                            // code: TextStyle(
                            //   backgroundColor: Colors.black,
                            //   color: Colors.white,
                            //   fontSize: 16
                      
                            // )
                          ),
                          key: const Key("defaultmarkdownformatter"),
                          builders: {
                            'code': CodeElementBuilder(),
                          }
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          txt,
                          style: TextStyle(
                              color: ColorLibrary.textThemeColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
                  
              // child: Text(content,
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w500,
              //         fontSize: 17)),
            ),
          ),
        ),
      ],
    );
  }
}
