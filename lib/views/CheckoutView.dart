import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/CheckoutModel.dart';
import '../widgets/AppBarHeaderText.dart';
import '../widgets/CheckoutListItem.dart';
import '../widgets/CheckoutTotalSummary.dart';
import '../widgets/NoItemsWidget.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarHeaderText(name: "Cart", fontWeight: FontWeight.w500, fontSize: 25),
        centerTitle: false,
      ),
      body: Consumer<CheckoutProvider>(
        builder: (context, checkoutProvider, _) {
          if (checkoutProvider.items.isEmpty) {
            return const NoItemsWidget(text: "Your shopping cart is empty");
          }

          double total = checkoutProvider.items.fold(
            0,
                (sum, item) => sum + double.parse(item.price) * item.quantity,
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: checkoutProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = checkoutProvider.items[index];
                    return CheckoutListItem(item: item, index: index);
                  },
                ),
              ),
              CheckoutTotalSummary(total: total),
            ],
          );
        },
      ),
    );
  }
}
