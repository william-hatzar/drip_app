import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class ProductNamePrice extends StatelessWidget {
  final String productName;
  final String productPrice;
  const ProductNamePrice({super.key, required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextWidget(
          text: productName,
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
        TextWidget(
          text: productPrice,
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ],
    );
  }
}
