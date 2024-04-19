import 'package:flutter/material.dart';

class FavouriteCategoryPrice extends StatelessWidget {
  final String category;
  final String price;
  const FavouriteCategoryPrice({super.key, required this.category, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          category,
          style: const TextStyle(
              fontSize: 14, color: Colors.grey),
        ),
        Text(
          "£$price",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
