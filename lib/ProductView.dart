import 'package:drip_app/widgets/AddToCartWidget.dart';
import 'package:drip_app/widgets/HeaderImage.dart';
import 'package:drip_app/widgets/ProductNamePrice.dart';
import 'package:drip_app/widgets/QuantityWidget.dart';
import 'package:drip_app/widgets/RatingAndReviews.dart';
import 'package:drip_app/widgets/SmallDivider.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:drip_app/widgets/ratings_builder.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final String productName;
  final String price;
  final String imageUrl;
  final String category;
  final String rating;
  final int reviews;
  final String description;

  const ProductView({
    Key? key,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.description,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int totalStars = 5;
  int _quantity = 1; // Initially set the quantity to 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDE6E6),
      body: Stack(
        children: [
          HeaderImage(imageUrl: widget.imageUrl),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              width: 400,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ProductNamePrice(productName: widget.productName, productPrice: widget.price),
                  TextWidget(text: widget.category, fontWeight: FontWeight.w400, fontSize: 17.33, fontColour: Colors.blueGrey),
                  RatingAndReviews(ratings: widget.rating, totalStars: totalStars, reviews: widget.reviews),
                  const SizedBox(height: 20),
                  TextWidget(text: widget.description, fontWeight: FontWeight.w400, fontSize: 15),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantityWidget(
                        initialValue: _quantity,
                        onChanged: (value) {
                          setState(() {
                            _quantity = value;
                          });
                        },
                      ),
                      const AddToCartWidget()
                    ],
                  ),
                ],
              ),
            ),
          ),
          SmallDivider()
        ],
      ),
    );
  }
}
