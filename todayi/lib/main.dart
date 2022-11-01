import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todayi/pages/home_page.dart';
import 'package:todayi/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final myTheme = Theme.of(context).textTheme.apply(
      bodyColor: ColorLibrary.textThemeColor,
      displayColor: ColorLibrary.textThemeColor,
      
    );

    return MaterialApp(
      title: 'Today I',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorLibrary.mainThemeColor,
        textTheme: GoogleFonts.latoTextTheme(myTheme),
      ),
      home: HomePage(),
    );
  }
}