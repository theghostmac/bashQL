import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static const _textSizeLarge = 35.0;
  static const String _forexqlFont = "U8";

  static final headerLarge = GoogleFonts.alegreya(
      fontSize: _textSizeLarge,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static const normalText = TextStyle(
    fontFamily: _forexqlFont,
    color: Colors.grey,
  );

  static const frontPageStyle = TextStyle(
      fontFamily: _forexqlFont,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static const moneyStyle = TextStyle(
      // fontFamily: _forexqlFont,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black);
}
