import 'package:flutter/material.dart';

import '../constants.dart';
import 'TextWidget.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: goodMorning, fontWeight: FontWeight.w400, fontSize: 16),
            const SizedBox(height: 5),
            TextWidget(text: personName, fontWeight: FontWeight.w400, fontSize: 24),
            const SizedBox(height: 10),
            Row(
              children: [
                locationOn,
                TextWidget(text: location, fontWeight: FontWeight.w200, fontSize: 14.33)
              ],
            ),
          ],
        ),
        const SizedBox(width: 90),
        Image.asset(avatarImg),
      ],
    );
  }
}
