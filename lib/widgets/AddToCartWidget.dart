import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: const TextWidget(
          text: "Add to cart",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontColour: Colors.white),
    );
  }
}
