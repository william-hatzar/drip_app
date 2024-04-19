import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/views/CheckoutView.dart';
import 'package:flutter/material.dart';

import '../views/Favorites.dart';
import '../views/HomeScreen.dart';
import '../models/FavoritesModel.dart';
import '../models/ProductModel.dart';
import '../models/ProductModelSInk.dart';

Widget bottomNavBar(BuildContext context, List<FavoritesModel> favProducts, ProductProvider productProvider, List<ProductsModel> products, List<CheckoutModel> checkoutItems, int quantity, Function(CheckoutModel) addToCheckout, int currentIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: currentIndex == 0 ? Colors.black : Colors.grey), // Check if the index is equal to the current index
          label: 'Home'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border, color: currentIndex == 1 ? Colors.black : Colors.grey),
        label: 'Favourites',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout, color: currentIndex == 2 ? Colors.black : Colors.grey), label: 'Checkout')
    ],
    onTap: (int index) {
      // Navigate to the corresponding page when a bottom navigation bar item is tapped
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(products: products, checkoutItems: checkoutItems)));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (_) => Favorites(favProducts: favProducts, productProvider: productProvider, quantity: quantity, addToCheckout: addToCheckout)));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutView()));
          break;
        default:
          Navigator.pushNamed(context, '/home');
          break;
      }
    },
  );
}
