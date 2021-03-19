import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtil {
  static TextStyle setTextStyle(
      {fontSize = 16.0,
      fontWeight = FontWeight.normal,
      decoration,
      fontColor = Colors.white}) {
    return GoogleFonts.comfortaa(
        fontSize: fontSize, color: fontColor, fontWeight: fontWeight, decoration: decoration);
  }
}
