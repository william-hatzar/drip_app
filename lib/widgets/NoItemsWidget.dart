import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class NoItemsWidget extends StatelessWidget {
  final String text;
  const NoItemsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextWidget(
          text: text,
          fontWeight: FontWeight.w200,
          fontSize: 30,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
