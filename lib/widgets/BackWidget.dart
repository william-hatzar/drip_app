import 'package:flutter/material.dart';

class Backwidget extends StatelessWidget {
  const Backwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 300,
      bottom: 700,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
      ),
    );
  }
}
