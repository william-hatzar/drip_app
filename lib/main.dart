import 'package:drip_app/models/CheckoutModel.dart';
import 'package:drip_app/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/ProductModelSInk.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ],
      child: const Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    final checkoutItems = Provider.of<CheckoutProvider>(context).items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(products: products, checkoutItems: checkoutItems),
    );
  }
}
