import 'package:booking_hotel/gen/fonts.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppText {
  static Text large(String text, {double fontSize = 18, TextAlign textAlign = TextAlign.start, int maxLines = 1, Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
  

  static Text small(String text, {double fontSize = 18, TextAlign textAlign = TextAlign.start, int maxLines = 1, Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  static Text medium(String data, {double fontSize = 18, TextAlign textAlign = TextAlign.start, int maxLines = 1, Color color = Colors.black}) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 12,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

class AppTextSpan extends TextSpan{
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double fontSize;
  final double? height;
  final double? letterSpacing;

  AppTextSpan.large(String data, 
  {this.color =  Colors.green, 
  this.fontWeight = FontWeight.bold, 
  this.textAlign, 
  this.fontSize = 18, 
  this.height, 
  this.letterSpacing,
  GestureRecognizer? recognizer})
   : super(
      text: data, 
      recognizer: recognizer,
      style: TextStyle(
        fontSize: fontSize, 
        color: color, 
        fontWeight: fontWeight, 
        height: height, 
        letterSpacing: letterSpacing
      ),
    );

  AppTextSpan.small(String data, 
  {this.color =  Colors.green, 
  this.fontWeight = FontWeight.bold, 
  this.textAlign, 
  this.fontSize = 18, 
  this.height, 
  this.letterSpacing,
  GestureRecognizer? recognizer})
   : super(
      text: data, 
      recognizer: recognizer,
      style: TextStyle(
        fontSize: fontSize, 
        color: color, 
        fontWeight: fontWeight, 
        height: height, 
        letterSpacing: letterSpacing
      ),
    );

  AppTextSpan.medium(String data, 
  {this.color =  Colors.green, 
  this.fontWeight = FontWeight.w600, 
  this.textAlign, 
  this.fontSize = 18, 
  this.height, 
  this.letterSpacing,
  TextDecoration textDecoration = TextDecoration.none,
  GestureRecognizer? recognizer})
   : super(
      text: data, 
      recognizer: recognizer,
      style: TextStyle(
        fontFamily: FontFamily.workSans,
        fontSize: fontSize, 
        color: color, 
        fontWeight: fontWeight, 
        height: height, 
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
    );
}