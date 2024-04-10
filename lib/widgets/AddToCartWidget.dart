import 'package:drip_app/views/CheckoutView.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CheckoutModel.dart';

class AddToCartWidget extends StatefulWidget {
  final Function(CheckoutModel) addToCheckout;
  final String productName;
  final String category;
  final String price;
  final String imageUrl;
  final int quantity;

  const AddToCartWidget(
      {super.key,
      required this.addToCheckout,
      required this.productName,
      required this.category,
      required this.price,
      required this.imageUrl,
      required this.quantity});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
        checkoutProvider.addToCheckout(CheckoutModel(
          productName: widget.productName,
          category: widget.category,
          price: widget.price,
          imageUrl: widget.imageUrl,
          quantity: widget.quantity,
        ));
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Add to cart",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}