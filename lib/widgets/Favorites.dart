import 'package:drip_app/models/FavoritesModel.dart';
import 'package:flutter/material.dart';

import '../models/ProductModelSInk.dart'; // Import ProductsModel

class Favorites extends StatefulWidget {
  final List<FavoritesModel> favProducts;
  final ProductProvider productProvider; // Add reference to ProductProvider

  const Favorites({Key? key, required this.favProducts, required this.productProvider}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: widget.favProducts.length, // Use the length of favProducts directly
              itemBuilder: (_, int index) {
                final favoriteProduct = widget.favProducts[index];
                if (!favoriteProduct.isFavourite) {
                  return const SizedBox.shrink(); // Skip non-favorite products
                }
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      // Find the index of the dismissed product in the ProductProvider
                      final productIndex = widget.productProvider.products.indexWhere(
                            (prod) => prod.productName == favoriteProduct.productName,
                      );
                      print(widget.productProvider.products[productIndex].isFavourite);
                      // If the product is found, update its isFavourite property to false
                      if (productIndex != -1) {
                        final product = widget.productProvider.products[productIndex];
                        product.isFavourite = false;

                        // Notify listeners of changes in ProductProvider
                        widget.productProvider.notifyListeners();
                      }

                      // Remove the dismissed product from the favProducts list
                      print(widget.productProvider.products[productIndex].isFavourite);
                      widget.favProducts.removeAt(index).isFavourite;
                    });
                  },

                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    child: ListTile(
                      title: Text(favoriteProduct.productName),
                      subtitle: Text(
                        "${favoriteProduct.isFavourite}",
                      ),
                      // Other widgets for displaying the favorite product details
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
            ),

          ),
        ],
      ),
    );
  }
}