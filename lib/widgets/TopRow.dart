import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  String leftText;
  String rightText;

  TopRow({super.key, required  this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        Text(
          rightText,
          style: const TextStyle(
            color: Color(0xff606368),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w200,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
