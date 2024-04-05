import 'package:flutter/material.dart';

class SmallDivider extends StatelessWidget {
  const SmallDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery
          .of(context)
          .size
          .height *
          0.07,
      // Adjust the position based on the image height
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        child: const Divider(
          height: 30,
          indent: 120,
          endIndent: 120,
          thickness: 4,
        ),
      ),
    );
  }
}