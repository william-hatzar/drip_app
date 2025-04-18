import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/views/Favorites.dart';
import 'package:drip_app/widgets/BottomNavBar.dart';
import 'package:drip_app/widgets/TopSection.dart';
import 'package:flutter/material.dart';
import 'package:drip_app/constants.dart';
import 'package:drip_app/models/ProductModel.dart';
import 'package:drip_app/models/ProductModelSInk.dart';
import 'package:drip_app/widgets/FliterButtonsListView.dart';
import 'package:drip_app/widgets/ProductsGridView.dart';
import 'package:drip_app/widgets/SearchWidget.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:drip_app/widgets/TopRow.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List<ProductsModel> products;
  final List<CheckoutModel> checkoutItems;

  const HomeScreen({Key? key, required this.products, required this.checkoutItems}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text1 = TextEditingController();
  Set<String> distinctCategories = Set();
  List<ProductsModel> filteredProducts = [];
  bool isGridView = true; // To track the current view mode
  List<FavoritesModel> favProducts = [];
  List<CheckoutModel> checkoutItems = [];
  var quantity = 1;


  // Function to add or remove a product from favorites
  void addToFavorites(FavoritesModel favProduct) {
    setState(() {
      final existingProductIndex = favProducts.indexWhere((product) =>
      product.productName == favProduct.productName &&
          product.category == favProduct.category &&
          product.price == favProduct.price &&
          product.description == favProduct.description);

      if (existingProductIndex != -1) {
        favProducts.removeAt(existingProductIndex);
      } else {
        favProducts.add(favProduct);
      }
    });
  }

  void addToCheckout(CheckoutModel checkout) {
    setState(() {
      final existingProductIndex = checkoutItems.indexWhere((product) =>
          product.productName == checkout.productName &&
          product.category == checkout.category &&
          product.price == checkout.price &&
          product.imageUrl == checkout.imageUrl &&
          quantity == checkout.quantity);

      if(existingProductIndex != -1) {
        checkoutItems.removeAt(existingProductIndex);
      } else {
        checkoutItems.add(checkout);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Use Provider to get access to ProductProvider and its products
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    filteredProducts = List.from(productProvider.products);
    for (var product in productProvider.products) {
      distinctCategories.add(product.category);
    }
  }

  void filterProductsByCategory(String category) {
    setState(() {
      if (category == "All") {
        // Show all products
        filteredProducts = List.from(widget.products);
      } else {
        // Filter products by selected category
        filteredProducts = widget.products.where((product) => product.category == category).toList();
      }
    });
  }

  void searchProducts(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        // If search text is empty, reset to display all products
        filteredProducts = List.from(widget.products);
      } else {
        // Filter products based on search text
        filteredProducts = widget.products
            .where((product) => product.productName.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              TopSection(),
              SizedBox(height: 20),
              SearchWidget(
                textController: text1,
                onChanged: searchProducts, // Call searchProducts when text changes
              ),
              SizedBox(height: 20),
              FilterButtonsListView(
                distinctCategories: distinctCategories,
                filterCallback: filterProductsByCategory,
              ),
              const SizedBox(height: 20),
              TopRow(leftText: topProducts, rightText: showAll),
              const SizedBox(height: 10),
              ProductGridView(filteredProducts: filteredProducts, addToFavorites: addToFavorites, quantity: quantity, addToCheckout: addToCheckout) // Display GridView
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, favProducts, Provider.of<ProductProvider>(context), widget.products, widget.checkoutItems, quantity, addToCheckout, 0), // Pass context to bottomNavBar function
    );
  }
}
