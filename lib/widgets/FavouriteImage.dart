import 'package:flutter/material.dart';

class FavouriteImage extends StatelessWidget {
  final String imageUrl;
  const FavouriteImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 100,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
