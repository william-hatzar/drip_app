import 'package:drip_app/widgets/TextWidget.dart';
import 'package:drip_app/widgets/ratings_builder.dart';
import 'package:flutter/material.dart';

class RatingAndReviews extends StatelessWidget {
  final String ratings;
  final int totalStars;
  final int reviews;
  const RatingAndReviews({super.key, required this.ratings, required this.totalStars, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        returnStars(int.parse(ratings), totalStars),
        const SizedBox(width: 5),
        TextWidget(
          text: "($reviews reviews)",
          fontWeight: FontWeight.w200,
          fontSize: 10,
        )
      ],
    );
  }
}
