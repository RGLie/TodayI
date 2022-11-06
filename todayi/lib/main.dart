import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/providers/button_provider.dart';
import 'package:todayi/utils/colors.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final myTheme = Theme.of(context).textTheme.apply(
      bodyColor: ColorLibrary.textThemeColor,
      displayColor: ColorLibrary.textThemeColor,
      fontFamily: 'Pretendard'
    );

    return MaterialApp(
      title: 'Today I',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorLibrary.mainThemeColor,
        textTheme: myTheme,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => StartButtonProvider()),
          ChangeNotifierProvider(
            create: (BuildContext context) => ButtonProvider()),
        ],
        child: HomePage()
      ),
    );
  }
}