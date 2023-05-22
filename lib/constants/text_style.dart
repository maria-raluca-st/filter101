import 'package:flutter/material.dart';

class TextStyles {
  static const String fontFamily = 'Inconsolata';

  static TextStyle heading({
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle subheading({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle body({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Add more text styles as needed
}
