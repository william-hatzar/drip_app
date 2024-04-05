import 'package:flutter/material.dart';
import 'package:drip_app/constants.dart';
import 'package:drip_app/models/ProductModel.dart';
import 'package:drip_app/models/ProductModelSInk.dart';
import 'package:drip_app/widgets/BottomNavBar.dart';
import 'package:drip_app/widgets/FliterButtonsListView.dart';
import 'package:drip_app/widgets/ProductsGridView.dart';
import 'package:drip_app/widgets/SearchWidget.dart';
import 'package:drip_app/widgets/TextWidget.dart';
import 'package:drip_app/widgets/TopRow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text1 = TextEditingController();
  Set<String> distinctCategories = Set();
  List<ProductsModel> filteredProducts = [];
  bool isGridView = true; // To track the current view mode

  @override
  void initState() {
    super.initState();
    // Extract distinct categories from the list of products
    for (var product in products) {
      distinctCategories.add(product.category);
    }
    // Initially display all products
    filteredProducts = List.from(products);
  }

  void filterProductsByCategory(String category) {
    setState(() {
      if (category == "All") {
        // Show all products
        filteredProducts = List.from(products);
      } else {
        // Filter products by selected category
        filteredProducts = products.where((product) => product.category == category).toList();
      }
    });
  }

  void searchProducts(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        // If search text is empty, reset to display all products
        filteredProducts = List.from(products);
      } else {
        // Filter products based on search text
        filteredProducts = products
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
                  ? ProductGridView(filteredProducts: filteredProducts) // Display GridView
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
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Toggle between grid and list view
            isGridView = !isGridView;
          });
        },
        child: Icon(isGridView ? Icons.list : Icons.grid_view),
      ),
    );
  }
}
