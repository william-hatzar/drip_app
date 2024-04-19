import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? fontColour;
  final TextAlign textAlign;
  const TextWidget({super.key, required this.text, required this.fontWeight, required this.fontSize, this.fontColour, this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: fontColour
      ),
    );
  }
}
