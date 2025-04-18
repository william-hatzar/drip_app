import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/widgets/BottomNavBar.dart';
import 'package:drip_app/widgets/NoItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ProductModelSInk.dart';
import '../widgets/AppBarHeaderText.dart';
import '../widgets/FavouriteListItem.dart'; // Import ProductsModel

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
              FavoriteListItem(
                favoriteProduct: favoriteProduct,
                productProvider: widget.productProvider,
                index: index,
                favProducts: widget.favProducts,
                quantity: widget.quantity,
                addToCheckout: widget.addToCheckout,
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
                      final providerIndex =
                      widget.productProvider.products.indexWhere(
                            (product) => product.productName == productName,
                      );
                      if (providerIndex != -1) {
                        widget.productProvider.products[providerIndex]
                            .isFavourite = false;
                      }
                      widget.productProvider.notifyListeners();
                    }
                    widget.favProducts.removeAt(productIndex);
                  });
                },
                onFavoriteChanged: (isFavorite) {
                  setState(() {
                    widget.favProducts[index].isFavourite = isFavorite;
                    if (!isFavorite) {
                      widget.favProducts.removeAt(index);
                    }
                  });
                },
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: Colors.grey[300],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: bottomNavBar(
        context,
        widget.favProducts,
        Provider.of<ProductProvider>(context),
        Provider
            .of<ProductProvider>(context)
            .products,
        Provider
            .of<CheckoutProvider>(context)
            .items,
        widget.quantity,
        widget.addToCheckout,
        1,
      ),
    );
  }
}