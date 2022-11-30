import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/content_page/note/note.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/edit_note/property_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';

class ContentPageChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sidebar_provider = Provider.of<SideBarProvider>(context);
    switch(sidebar_provider.side_bar_index){
      case 1:
        return Text('1');
      case 2:
        return Text('2');
      case 3:
        return Text('3');
      case 4:
        return Text('4');
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AddButtonProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => PropertyProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => CardNoteButtonProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => NoteProvider()),
      ],
      child: Note()
    );
  }
}