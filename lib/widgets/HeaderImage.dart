import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String imageUrl;
  const HeaderImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
