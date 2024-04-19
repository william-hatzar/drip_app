import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/views/ProductView.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final List<ProductsModel> filteredProducts;
  final Function(FavoritesModel) addToFavorites;
  final int quantity;
  final Function(CheckoutModel) addToCheckout;

  const ProductGridView({
    super.key,
    required this.filteredProducts,
    required this.addToFavorites,
    required this.quantity,
    required this.addToCheckout
  });

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemCount: widget.filteredProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductView(
                  products: widget.filteredProducts[index],
                  productIndex: index,
                  productName: widget.filteredProducts[index].productName,
                  imageUrl: widget.filteredProducts[index].imageUrl,
                  price: widget.filteredProducts[index].price,
                  category: widget.filteredProducts[index].category,
                  rating: widget.filteredProducts[index].rating,
                  reviews: widget.filteredProducts[index].reviews,
                  description: widget.filteredProducts[index].description,
                  favourite: widget.filteredProducts[index].isFavourite,
                  addToFavorites: widget.addToFavorites,
                  onFavoriteChanged: (isFavorite) {
                    setState(() {
                      widget.filteredProducts[index].isFavourite = isFavorite;
                    });
                  },
                  quantity: widget.quantity,
                  addToCheckout: widget.addToCheckout,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.filteredProducts[index].imageUrl,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.filteredProducts[index].productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  widget.filteredProducts[index].category,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  "£${widget.filteredProducts[index].price}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
