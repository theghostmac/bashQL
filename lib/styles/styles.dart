import 'package:flutter/material.dart';

class Style {
  static const _textSizeLarge = 25.0;
  static const String _forexqlFont = "U8";

  static const headerLarge = TextStyle(
      fontFamily: _forexqlFont,
      fontSize: _textSizeLarge,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static const normalText = TextStyle(
    fontFamily: _forexqlFont,
    color: Colors.grey,
  );
}
