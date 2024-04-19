import 'package:flutter/material.dart';

class CheckoutModel {
  String productName;
  String category;
  String price;
  String imageUrl;
  int quantity;

  CheckoutModel({
    required this.productName,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class CheckoutProvider extends ChangeNotifier {
  List<CheckoutModel> _items = [];

  List<CheckoutModel> get items => _items;

  void addToCheckout(CheckoutModel checkout) {
    _items.add(checkout);
    notifyListeners();
  }

  void removeFromCheckout(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(CheckoutModel checkout, int newQuantity) {
    final index = _items.indexOf(checkout);
    if (index != -1) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void increaseQuantity(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(int index) {
    if (index >= 0 && index < _items.length && _items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }
}
