import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.roboto(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.roboto(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.roboto(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

const ColorScheme myColorSchemeDark = ColorScheme.dark(
  primary: Color(0xff8c0000),
  onPrimary: Color(0xfffaf2f2),
  primaryVariant: Color(0xff0d0e1a),
  secondary: Color(0xfff20f28),
  onSecondary: Color(0xffffffff),
  secondaryVariant: Color(0xff750404),
  surface: Color(0xFF451d1d),
  onSurface: Color(0xffdedede),
  background: Color(0xffe8c5c5),
  onBackground: Color(0xffffffff),
  error: Color(0xffffc505),
  onError: Color(0xffffffff),
  brightness: Brightness.dark,
);

const ColorScheme myColorSchemeLight = ColorScheme.light(
  primary: Color(0xffb51f1f),
  onPrimary: Color(0xffffffff),
  primaryVariant: Color(0xff8c0000),
  secondary: Color(0xffffffff),
  onSecondary: Color(0xffffffff),
  secondaryVariant: Color(0xffffffff),
  surface: Colors.white,
  onSurface: Colors.black87,
  background: Color(0xffe8c5c5),
  onBackground: Color(0xffffffff),
  error: Color(0xffffc505),
  onError: Color(0xffffffff),
  brightness: Brightness.light,
);
