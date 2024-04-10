import 'package:drip_app/ProductView.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import 'models/ProductModelSInk.dart'; // Import ProductsModel

class Favorites extends StatefulWidget {
  final List<FavoritesModel> favProducts;
  final ProductProvider productProvider; // Add reference to ProductProvider

  const Favorites(
      {Key? key, required this.favProducts, required this.productProvider})
      : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  @override
  Widget build(BuildContext context) {
    print(widget.favProducts.map((e) => e.isFavourite.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextWidget(
                text: "Favorites",
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
              SizedBox(width: 30),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: widget.favProducts.isEmpty
          ? const Center(
        child: TextWidget(
          text: 'No favorites to display',
          fontWeight: FontWeight.w200,
          fontSize: 30,
        ),
      )
          : ListView.builder(
        itemCount: widget.favProducts.length,
        itemBuilder: (context, index) {
          final favoriteProduct = widget.favProducts[index];
          if (!favoriteProduct.isFavourite) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  color: const Color(0xffFF6F6F),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image.asset("images/trash_icon.png"),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    final productIndex = widget.favProducts.indexWhere(
                          (favProduct) =>
                      favProduct.productName ==
                          favoriteProduct.productName,
                    );
                    if (productIndex != -1) {
                      final productName =
                          widget.favProducts[productIndex].productName;
                      // Remove the favorite status from the product in the product provider
                      final productIndexInProvider =
                      widget.productProvider.products.indexWhere(
                            (product) => product.productName == productName,
                      );
                      if (productIndexInProvider != -1) {
                        widget.productProvider
                            .products[productIndexInProvider]
                            .isFavourite = false;
                      }
                      widget.productProvider
                          .notifyListeners(); // Notify listeners for changes
                    }
                    // Remove the product from the favorites list
                    widget.favProducts.removeAt(productIndex);
                  });
                },
                child: Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 0,
                  color: Colors.transparent,
                  // Remove elevation
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8), // Set rectangular shape
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        favoriteProduct.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: TextWidget(
                      text: favoriteProduct.productName,
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          favoriteProduct.category,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          favoriteProduct.price,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final productIndex =
                      widget.productProvider.products.indexWhere(
                            (prod) =>
                        prod.productName ==
                            favoriteProduct.productName,
                      );
                      if (productIndex != -1) {
                        final product = widget
                            .productProvider.products[productIndex];
                        final updatedFavorite = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductView(
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
                                      // Update the favorite status locally in the Favorites page
                                      widget.favProducts[index].isFavourite =
                                          isFavorite;
                                      if (!isFavorite) {
                                        // If the product is unfavorited, remove it from the favProducts list
                                        widget.favProducts.removeAt(index);
                                      }
                                    });
                                  },
                                ),
                          ),
                        );
                        // Update the favorite status locally if it's changed in the ProductView page
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
    );
  }
}