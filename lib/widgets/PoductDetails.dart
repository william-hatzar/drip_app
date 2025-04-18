import 'package:flutter/material.dart';

import '../models/CheckoutModel.dart';
import 'AddToCartWidget.dart';
import 'ProductNamePrice.dart';
import 'QuantityWidget.dart';
import 'RatingAndReviews.dart';
import 'TextWidget.dart';

class ProductDetails extends StatefulWidget {
  final String productName;
  final String price;
  final String category;
  final String rating;
  final int reviews;
  final String description;
  final int quantity;
  final String imageUrl;
  final Function(CheckoutModel) addToCheckout;

  const ProductDetails({
    super.key,
    required this.productName,
    required this.price,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.quantity,
    required this.addToCheckout,
    required this.imageUrl,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        ProductNamePrice(
          productName: widget.productName,
          productPrice: "£${widget.price}",
        ),
        TextWidget(
          text: widget.category,
          fontWeight: FontWeight.w400,
          fontSize: 17.33,
          fontColour: Colors.blueGrey,
        ),
        RatingAndReviews(
          ratings: widget.rating,
          totalStars: 5,
          reviews: widget.reviews,
        ),
        const SizedBox(height: 20),
        TextWidget(
          text: widget.description,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuantityWidget(
              initialValue: quantity,
              onChanged: (value) {
                setState(() {
                  quantity = value;
                });
              },
            ),
            AddToCartWidget(
              addToCheckout: widget.addToCheckout,
              productName: widget.productName,
              category: widget.category,
              price: widget.price,
              imageUrl: widget.imageUrl,
              quantity: quantity,
            ),
          ],
        ),
      ],
    );
  }
}
