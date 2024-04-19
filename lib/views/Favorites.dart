import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/views/ProductView.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/widgets/BottomNavBar.dart';
import 'package:drip_app/widgets/DismissableFavouriteCard.dart';
import 'package:drip_app/widgets/FavouriteCategoryPrice.dart';
import 'package:drip_app/widgets/FavouriteImage.dart';
import 'package:drip_app/widgets/NoItemsWidget.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ProductModelSInk.dart';
import '../widgets/AppBarHeaderText.dart'; // Import ProductsModel

class Favorites extends StatefulWidget {
  final List<FavoritesModel> favProducts;
  final ProductProvider productProvider;
  final int quantity;
  final Function(CheckoutModel)
      addToCheckout; // Add reference to ProductProvider

  const Favorites(
      {Key? key,
      required this.favProducts,
      required this.productProvider,
      required this.quantity,
      required this.addToCheckout})
      : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarHeaderText(
            name: "Favorites", fontWeight: FontWeight.w500, fontSize: 25),
        centerTitle: false,
      ),
      body: widget.favProducts.isEmpty
          ? const NoItemsWidget(text: "No Favorites to display")
          : ListView.builder(
              itemCount: widget.favProducts.length,
              itemBuilder: (context, index) {
                final favoriteProduct = widget.favProducts[index];
                if (!favoriteProduct.isFavourite) {
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [
                    DismissibleFavoriteCard(
                      favoriteProduct: favoriteProduct,
                      productProvider: widget.productProvider,
                      onDismissed: () {
                        setState(() {
                          final productIndex = widget.favProducts.indexWhere(
                            (favProduct) =>
                                favProduct.productName ==
                                favoriteProduct.productName,
                          );
                          if (productIndex != -1) {
                            final productName =
                                widget.favProducts[productIndex].productName;
                            final productIndexInProvider =
                                widget.productProvider.products.indexWhere(
                              (product) => product.productName == productName,
                            );
                            if (productIndexInProvider != -1) {
                              widget
                                  .productProvider
                                  .products[productIndexInProvider]
                                  .isFavourite = false;
                            }
                            widget.productProvider.notifyListeners();
                          }
                          widget.favProducts.removeAt(productIndex);
                        });
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        elevation: 0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: FavouriteImage(
                              imageUrl: favoriteProduct.imageUrl),
                          title: TextWidget(
                            text: favoriteProduct.productName,
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                          ),
                          subtitle: FavouriteCategoryPrice(
                              category: favoriteProduct.category,
                              price: favoriteProduct.price),
                          onTap: () async {
                            final productIndex =
                                widget.productProvider.products.indexWhere(
                              (prod) =>
                                  prod.productName ==
                                  favoriteProduct.productName,
                            );
                            if (productIndex != -1) {
                              final product =
                                  widget.productProvider.products[productIndex];
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
                                    addToFavorites: (favModel) {
                                      // Implement addToFavorites function if needed
                                    },
                                    onFavoriteChanged: (isFavorite) {
                                      setState(() {
                                        widget.favProducts[index].isFavourite =
                                            isFavorite;
                                        if (!isFavorite) {
                                          widget.favProducts.removeAt(index);
                                        }
                                      });
                                    },
                                    quantity: widget.quantity,
                                    addToCheckout: widget.addToCheckout,
                                  ),
                                ),
                              );
                              if (updatedFavorite != null &&
                                  updatedFavorite !=
                                      favoriteProduct.isFavourite) {
                                setState(() {
                                  favoriteProduct.isFavourite = updatedFavorite;
                                });
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    Divider(
                      height: 0, // Set height to 0 to remove extra space
                      thickness: 1, // Set thickness for the divider line
                      color: Colors.grey[300], // Set divider color
                    ),
                  ],
                );
              },
            ),
      bottomNavigationBar: bottomNavBar(
          context,
          widget.favProducts,
          Provider.of<ProductProvider>(context),
          Provider.of<ProductProvider>(context).products,
          Provider.of<CheckoutProvider>(context).items,
          widget.quantity,
          widget.addToCheckout,
          1),
    );
  }
}
