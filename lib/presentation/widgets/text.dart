import 'package:flutter/material.dart';

class MyText {
  static Widget text(String text,
      {Color? textColor, double? fontSize, FontWeight? fontWeight,TextOverflow? overflow}) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
    );
  }
}
