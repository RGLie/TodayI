import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/providers/note/add_button_provider.dart';
import 'package:todayi/utils/colors.dart';

class TextContent extends StatefulWidget {
  const TextContent({super.key});

  @override
  State<TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  final _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _addButtonProvider = Provider.of<AddButtonProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _textController,
            minLines: 5,
            maxLines: 5,
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

          SizedBox(
            height: 15,
          ),

          if(_addButtonProvider.is_code_clicked==1)...[
            TextFormField(
              controller: _textController,
              minLines: 5,
              maxLines: 5,
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
          ]
        ],
      ),
    );
  }
}
