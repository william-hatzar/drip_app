import "package:flutter/material.dart";

Widget returnStars(int filledStars, int totalStars) {
  List<Widget> stars = [];

  for (int i = 0; i < filledStars; i++) {
    stars.add(
      const Icon(
        Icons.star,
        size: 24,
        color: Colors.black,
      ),
    );
  }

  for (int i = 0; i < totalStars - filledStars; i++) {
    stars.add(
      const Icon(
        Icons.star_border,
        size: 24,
        color: Colors.black,
      ),
    );
  }
  return Row(
    children: stars,
  );
}