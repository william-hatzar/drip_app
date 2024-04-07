import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/widgets/Favorites.dart';
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
  final List<ProductsModel> products; // Add this line
  const HomeScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text1 = TextEditingController();
  Set<String> distinctCategories = Set();
  List<ProductsModel> filteredProducts = [];
  bool isGridView = true; // To track the current view mode
  List<FavoritesModel> favProducts = [];


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
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: goodMorning, fontWeight: FontWeight.w400, fontSize: 16),
                      const SizedBox(height: 5),
                      TextWidget(text: personName, fontWeight: FontWeight.w400, fontSize: 24),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          locationOn,
                          TextWidget(text: location, fontWeight: FontWeight.w200, fontSize: 14.33)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 90),
                  Image.asset(avatarImg),
                ],
              ),
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
              isGridView
                  ? ProductGridView(filteredProducts: filteredProducts, addToFavorites: addToFavorites) // Display GridView
                  : ListView.builder(
                // Display ListView
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProducts[index].productName),
                    subtitle: Text(filteredProducts[index].description),
                    // You can customize ListTile according to your product model
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, favProducts, Provider.of<ProductProvider>(context)), // Pass context to bottomNavBar function
    );
  }
}

Widget bottomNavBar(BuildContext context, List<FavoritesModel> favProducts, ProductProvider productProvider) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Favourites',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
    ],
    onTap: (int index) {
      // Navigate to the corresponding page when a bottom navigation bar item is tapped
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (_) => Favorites(favProducts: favProducts, productProvider: productProvider)));
          break;
        case 2:
          Navigator.pushNamed(context, '/settings');
          break;
        default:
          Navigator.pushNamed(context, '/home');
          break;
      }
    },
  );
}
