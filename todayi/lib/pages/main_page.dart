import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todayi/data/content.dart';
import 'package:todayi/data/tag.dart';
import 'package:todayi/data/user.dart';
import 'package:todayi/pages/main_page_sidebar.dart';
import 'package:todayi/providers/main_home_page/sidebar_provider.dart';
import 'package:todayi/providers/data_provider.dart';
import 'package:todayi/providers/note/edit_note/add_button_provider.dart';
import 'package:todayi/providers/note/edit_note/property_provider.dart';
import 'package:todayi/providers/note/note_provider.dart';
import 'package:todayi/providers/note/show_note/card_note_button_provider.dart';
import 'package:todayi/providers/note/show_note/icon_provider.dart';

class MainPage extends StatelessWidget {
  User? userData;
  MainPage(this.userData);
  DataProvider db = DataProvider();
  DataProvider db2 = DataProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<TUser>.value(
          value: db.getUser(userData!.uid),
          initialData: TUser(
              email: '',
              uid: '',
              name: '',
              registerdate: '',
              recentlogindate: '',
              count: 0,
              istag: false,
              taglist: ['index']),
        ),
        StreamProvider<List<Tag>>.value(
          value: db.getNotes(userData!.uid),
          initialData: [],
        ),
        StreamProvider<List<NoteContent>>.value(
          value: db2.getNoteContents(userData!.uid),
          initialData: [],
        ),
        ChangeNotifierProvider(
            create: (BuildContext context) => SideBarProvider()),

        ChangeNotifierProvider(
          create: (BuildContext context) => AddButtonProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => PropertyProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => CardNoteButtonProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => NoteProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => IconProvider()),
      ], 
      child: MainPageSideBar());
  }
}
