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
          Container(
            margin: EdgeInsets.all(10),
            //color: ColorLibrary.cardColor,
            child: TextFormField(
              controller: _textController,
              minLines: 4,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              cursorColor: ColorLibrary.textThemeColor,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  hintText: '노트를 입력하세요.',
                  //labelText: '노트를 입력하세요',
                  labelStyle: TextStyle(color: ColorLibrary.textThemeColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorLibrary.textThemeColor),
                  )
                ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '빈칸입니다.';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
