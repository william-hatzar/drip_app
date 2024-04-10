import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/CheckoutModel.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Consumer<CheckoutProvider>(
        builder: (context, checkoutProvider, _) {
          // Calculate the total price
          double total = 0;
          for (var item in checkoutProvider.items) {
            total += double.parse(item.price);
          }
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: checkoutProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = checkoutProvider.items[index];
                    return ListTile(
                      title: Text(item.productName),
                      subtitle: Text(item.category),
                      trailing: Text(item.price),
                    );
                  },
                ),
              ),
              // Display the total price
              Text(
                'Total Price: \$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
