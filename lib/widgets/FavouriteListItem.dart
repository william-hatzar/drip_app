import 'package:flutter/material.dart';

import '../models/CheckoutModel.dart';
import '../models/FavoritesModel.dart';
import '../models/ProductModelSInk.dart';
import '../views/ProductView.dart';
import 'DismissableFavouriteCard.dart';
import 'FavouriteCategoryPrice.dart';
import 'FavouriteImage.dart';
import 'TextWidget.dart';

class FavoriteListItem extends StatelessWidget {
  final FavoritesModel favoriteProduct;
  final ProductProvider productProvider;
  final int index;
  final List<FavoritesModel> favProducts;
  final int quantity;
  final Function(CheckoutModel) addToCheckout;
  final VoidCallback onDismissed;
  final Function(bool) onFavoriteChanged;

  const FavoriteListItem({
    super.key,
    required this.favoriteProduct,
    required this.productProvider,
    required this.index,
    required this.favProducts,
    required this.quantity,
    required this.addToCheckout,
    required this.onDismissed,
    required this.onFavoriteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DismissibleFavoriteCard(
      favoriteProduct: favoriteProduct,
      productProvider: productProvider,
      onDismissed: onDismissed,
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: FavouriteImage(imageUrl: favoriteProduct.imageUrl),
          title: TextWidget(
            text: favoriteProduct.productName,
            fontWeight: FontWeight.w400,
            fontSize: 19,
          ),
          subtitle: FavouriteCategoryPrice(
            category: favoriteProduct.category,
            price: favoriteProduct.price,
          ),
          onTap: () async {
            final productIndex = productProvider.products.indexWhere(
                  (prod) => prod.productName == favoriteProduct.productName,
            );

            if (productIndex != -1) {
              final product = productProvider.products[productIndex];
              final updatedFavorite = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductView(
                    products: product,
                    productIndex: productIndex,
                    productName: product.productName,
                    imageUrl: product.imageUrl,
                    price: product.price,
                    category: product.category,
                    rating: product.rating,
                    reviews: product.reviews,
                    favourite: product.isFavourite,
                    description: product.description,
                    addToFavorites: (_) {},
                    onFavoriteChanged: onFavoriteChanged,
                    quantity: quantity,
                    addToCheckout: addToCheckout,
                  ),
                ),
              );

              if (updatedFavorite != null &&
                  updatedFavorite != favoriteProduct.isFavourite) {
                onFavoriteChanged(updatedFavorite);
              }
            }
          },
        ),
      ),
    );
  }
}
