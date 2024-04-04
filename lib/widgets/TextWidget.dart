import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? fontColour;
  const TextWidget({Key? key, required this.text, required this.fontWeight, required this.fontSize, this.fontColour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: fontColour
      ),
    );
  }
}
