import 'package:flutter/material.dart';

import 'TextWidget.dart';

class CheckoutTotalSummary extends StatelessWidget {
  final double total;

  const CheckoutTotalSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Total",
                fontWeight: FontWeight.w400,
                fontSize: 19,
              ),
              TextWidget(
                text: '£${total.toStringAsFixed(2)}',
                fontWeight: FontWeight.w400,
                fontSize: 21,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xff294458),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextWidget(
              text: "Checkout",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontColour: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
