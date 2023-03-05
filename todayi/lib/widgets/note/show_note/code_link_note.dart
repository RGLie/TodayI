import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/utils/code_element.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class CodeLinkNote extends StatelessWidget {
  String content;
  String code;
  String language;
  String link;
  String subtag;
  String tagname;
  Color cardcolor;
  int count;

  CodeLinkNote({
    super.key,
    required this.content,
    required this.code,
    required this.link,
    required this.count,
    required this.tagname,
    this.subtag = '',
    this.language='dart',
    this.cardcolor = const Color(0xffe0d1ba)
  });

  @override
  Widget build(BuildContext context) {
    String codeblock = '```$language\n$code';
    var user_data = Provider.of<TUser>(context);
    var today_note = Provider.of<NoteProvider>(context);
    var rsp = Responsive(pageContext: context);
    String contentID = subtag==''?
      tagname + '?' + today_note.today_date + '?' + count.toString()
      :tagname + '.'+ subtag+'?' + today_note.today_date + '?' + count.toString();
    
    
    return Column(
      children: [
        // SizedBox(
        //   height: 15,
        // ),
        Dismissible(
          key: Key(contentID),
            background: Container(
              
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(rsp.rspWidth(10)),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(rsp.rspWidth(15)),
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
              Fluttertoast.showToast(msg: '링크를 들어가기 위해 길게 눌러주세요.',
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
              padding: EdgeInsets.only( top: rsp.rspHeight(15), bottom: rsp.rspHeight(10)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardcolor,
                borderRadius: BorderRadius.circular(rsp.rspWidth(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: rsp.rspWidth(15), right: rsp.rspWidth(15)),
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
                              fontSize: rsp.rspWidth(17)),
                          h4: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: rsp.rspWidth(20)),
                          h3: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: rsp.rspWidth(22)),
                          h2: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: rsp.rspWidth(25)),
                          h1: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: rsp.rspWidth(28)),
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
                    height: rsp.rspHeight(15),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(left: rsp.rspWidth(10), right: rsp.rspWidth(10)),
                    child: InkWell(
                      onTap: () {
                      Clipboard.setData(ClipboardData(text:code));
                      Fluttertoast.showToast(msg: '코드가 복사되었습니다.',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        webBgColor: "linear-gradient(to right, #3A2000, #3A2000)",
                        webPosition: 'center',
                        
                        fontSize: 20.0,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_SHORT
                      );
                    },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          //padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: Color(0xff282c34),
                              //borderRadius: BorderRadius.all(Radius.circular(5))
                              //borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
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
                                    fontSize: rsp.rspWidth(17)),
                                h4: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: rsp.rspWidth(20)),
                                h3: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: rsp.rspWidth(22)),
                                h2: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: rsp.rspWidth(25)),
                                h1: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: rsp.rspWidth(28)),
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
