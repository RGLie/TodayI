import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/content_page/note/note.dart';
import 'package:todayi/pages/page_2/page_2.dart';
import 'package:todayi/pages/page_3/page_3.dart';
import 'package:todayi/pages/page_4/page_4.dart';
import 'package:todayi/pages/page_5/page_5.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/edit_note/property_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';

class ContentPageChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sidebar_provider = Provider.of<SideBarProvider>(context);
    switch (sidebar_provider.side_bar_index) {
      case 1:
        return SecondPage();
      case 2:
        return ThirdPage();
      case 3:
        return FourthPage();
      case 4:
        return FifthPage();
    }
    return Note();
  }
}
