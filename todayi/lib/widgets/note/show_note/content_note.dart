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
import 'package:url_launcher/url_launcher.dart';

class ContentNote extends StatelessWidget {
  String content;
  String subtag;
  String tagname;
  Color cardcolor;
  int count;

  ContentNote({
    super.key,
    required this.content,
    required this.count,
    required this.tagname,
    this.cardcolor = const Color(0xffE5DDD1),
    this.subtag = ''
  });

  @override
  Widget build(BuildContext context) {
    var user_data = Provider.of<TUser>(context);
    var today_note = Provider.of<NoteProvider>(context);
    String contentID = subtag==''?
      tagname + '?' + today_note.today_date + '?' + count.toString()
      :tagname + '.'+ subtag+'?' + today_note.today_date + '?' + count.toString();
    
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

          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: cardcolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarkdownBody(
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     IconButton(
                //         onPressed: () {
                //           Clipboard.setData(ClipboardData(text:content));
                //           Fluttertoast.showToast(msg: '복사되었습니다.',
                //             gravity: ToastGravity.BOTTOM,
                //             backgroundColor: Colors.white,
                //             webBgColor: "linear-gradient(to right, #3A2000, #3A2000)",
                //             webPosition: 'center',
                            
                //             fontSize: 20.0,
                //             textColor: Colors.white,
                //             toastLength: Toast.LENGTH_SHORT
                //           );
                //         },
                //         icon: Icon(
                //           Icons.content_copy_outlined,
                //           color: ColorLibrary.textThemeColor,
                //           size: 18,
                //         )),
                //     IconButton(
                //         onPressed: () {
                //           CollectionReference contents = FirebaseFirestore.instance
                //             .collection('users')
                //             .doc(user_data.uid)
                //             .collection('contents');
                          
                //           contents.doc(contentID).delete();
                          
                //         },
                //         icon: Icon(
                //           Icons.delete_outline,
                //           color: ColorLibrary.textThemeColor,
                //           size: 22,
                //         )),
                //   ],
                // ),
              ],
            ),
            
            // child: Text(content,
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.w500,
            //         fontSize: 17)),
          ),
        ),
      ],
    );
  }
}
