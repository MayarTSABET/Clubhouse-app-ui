import 'package:clubhouse/constants.dart';
import 'package:clubhouse/pages/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clubhouse UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: kBackgroundColor),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColorGreen),
        iconTheme: IconThemeData(color: Colors.black),
        //fontFamily: GoogleFonts.montserrat().fontFamily,
        //textTheme: GoogleFonts.montserratTextTheme(), 
      ),
      home: home_page(),
    );
  }
}


