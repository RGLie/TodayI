import 'package:flutter/material.dart';
import 'package:todayi/pages/content_page/note/edit_note/add_content.dart';
import 'package:todayi/pages/content_page/note/edit_note/text_content.dart';
import 'package:todayi/utils/colors.dart';
import 'package:todayi/utils/responsive.dart';
import 'package:todayi/widgets/note/edit_note/add_content_button.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    var rsp = Responsive(pageContext: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('노트 에디터',
            style: TextStyle(
                fontSize: rsp.rspWidth(40),
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        SizedBox(height: rsp.rspHeight(15)),
        Container(
          color: Colors.black12,
          width: double.infinity,
          height: 1,
        ),
        SizedBox(height: rsp.rspHeight(15)),
        Text('내용 추가하기',
          style: TextStyle(
            fontSize: rsp.rspWidth(25),
            fontWeight: FontWeight.w700,
            color: Colors.black)),
        SizedBox(
          height: rsp.rspHeight(15),
        ),
        AddContent(),
        SizedBox(
          height: rsp.rspHeight(15),
        ),
        TextContent()
      ],
    );
  }
}
