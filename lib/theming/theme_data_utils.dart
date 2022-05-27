import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataUtils {
  static ThemeData getThemeData() {
    return ThemeData(
      primarySwatch: Colors.purple,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          primary: Colors.deepPurple,
          secondary: Colors.greenAccent,
          tertiary: Colors.amberAccent
      ),
      textTheme: TextTheme(
        button: GoogleFonts.roboto(
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: Color(Colors.white.value),
        ),
        caption: GoogleFonts.roboto(
            fontWeight: FontWeight.w300,
            fontSize: 15
        ),
        bodyText1: GoogleFonts.roboto(
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: Color(Colors.black.value),
        ),
        bodyText2: GoogleFonts.roboto(
          fontSize: 18,
          color: Color(Colors.black.value),
        ),
        headline1: GoogleFonts.roboto(
          fontWeight: FontWeight.w900,
          fontSize: 65,
          color: Color(Colors.black.value),
        ),
        subtitle1: GoogleFonts.roboto(
          fontWeight: FontWeight.w800,
          fontSize: 22,
        ),
        subtitle2: GoogleFonts.roboto(
          fontSize: 25,
          color: Color(Colors.black.value),
        ),
      ),
    );
  }
}