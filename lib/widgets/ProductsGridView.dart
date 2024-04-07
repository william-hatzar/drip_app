import 'package:drip_app/ProductView.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductsModel> filteredProducts;
  final Function(FavoritesModel) addToFavorites;

  const ProductGridView({
    Key? key,
    required this.filteredProducts,
    required this.addToFavorites,
  }) : super(key: key);

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
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductView(
                  products: filteredProducts[index],
                  productIndex: index,
                  productName: filteredProducts[index].productName,
                  imageUrl: filteredProducts[index].imageUrl,
                  price: filteredProducts[index].price,
                  category: filteredProducts[index].category,
                  rating: filteredProducts[index].rating,
                  reviews: filteredProducts[index].reviews,
                  description: filteredProducts[index].description,
                  favourite: filteredProducts[index].isFavourite,
                  addToFavorites: addToFavorites,
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
                      filteredProducts[index].imageUrl,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  filteredProducts[index].productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  filteredProducts[index].category,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  filteredProducts[index].price,
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
