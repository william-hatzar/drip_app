import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class AppBarHeaderText extends StatelessWidget {
  final String name;
  final FontWeight fontWeight;
  final double fontSize;
  const AppBarHeaderText({Key? key, required this.name, required this.fontWeight, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextWidget(
            text: name,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
