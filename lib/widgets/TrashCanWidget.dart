import 'package:flutter/material.dart';

class TrashCanWidget extends StatelessWidget {
  final String imagePath;
  const TrashCanWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: const Color(0xffFF6F6F),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}
