import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/models/ProductModel.dart';
import 'package:drip_app/widgets/BackWidget.dart';
import 'package:drip_app/widgets/FavoriteWidget.dart';
import 'package:drip_app/widgets/HeaderImage.dart';
import 'package:drip_app/widgets/PoductDetails.dart';
import 'package:drip_app/widgets/SmallDivider.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final ProductsModel products;
  final int productIndex;
  final String productName;
  final String price;
  final String imageUrl;
  final String category;
  final String rating;
  final int reviews;
  final bool favourite;
  final String description;
  final Function(FavoritesModel) addToFavorites;
  final Function(bool) onFavoriteChanged;
  final Function(CheckoutModel) addToCheckout;
  final int quantity;

  const ProductView(
      {Key? key,
      required this.products,
      required this.productIndex,
      required this.productName,
      required this.imageUrl,
      required this.price,
      required this.category,
      required this.rating,
      required this.reviews,
      required this.favourite,
      required this.description,
      required this.addToFavorites,
      required this.onFavoriteChanged,
      required this.quantity,
      required this.addToCheckout // Add quantity to the constructor
      })
      : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool favorite = false;
  late int _quantity; // Declare _quantity as a state variable

  @override
  void initState() {
    super.initState();
    favorite = widget.favourite;
    _quantity = widget.quantity; // Initialize _quantity from the passed value
  }

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
              child: ProductDetails(productName: widget.productName,
                  price: widget.price,
                  category: widget.category,
                  rating: widget.rating,
                  reviews: widget.reviews,
                  description: widget.description,
                  quantity: widget.quantity,
                  addToCheckout: widget.addToCheckout,
                  imageUrl: widget.imageUrl)
            ),
          ),
          const SmallDivider(),
          FavouriteWidget(
              favorite: favorite,
              onFavoriteChanged: (bool newFavorite) {
                setState(() {
                  favorite = !favorite;
                  widget.products.isFavourite = favorite;
                  widget.addToFavorites(FavoritesModel(
                    productName: widget.productName,
                    category: widget.category,
                    price: widget.price,
                    description: widget.description,
                    isFavourite: favorite,
                    imageUrl: widget.imageUrl,
                  ));
                  widget.onFavoriteChanged(favorite);
                });
              }),
            const Backwidget()
        ],
      ),
    );
  }
}
