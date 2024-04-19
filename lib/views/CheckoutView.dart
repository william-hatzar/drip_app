import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/CheckoutModel.dart';
import '../widgets/AppBarHeaderText.dart';
import '../widgets/NoItemsWidget.dart';
import '../widgets/TextWidget.dart';

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
          double total = 0;
          for (var item in checkoutProvider.items) {
            total += double.parse(item.price) * item.quantity;
          }
          if (checkoutProvider.items.isEmpty) {
            return const NoItemsWidget(text: "Your shopping cart is empty");
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: checkoutProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = checkoutProvider.items[index];
                    return Column(
                      children: [
                        Dismissible(
                          key: Key(item.productName),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: const Color(0xffFF6F6F),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset("images/trash_icon.png"),
                          ),
                          onDismissed: (direction) {
                            Provider.of<CheckoutProvider>(
                              context,
                              listen: false,
                            ).removeFromCheckout(index);
                          },
                          child: Card(
                            elevation: 0,
                            margin: EdgeInsets.all(8),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.imageUrl,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align to the left and right
                                children: [
                                  TextWidget(text: item.productName, fontWeight: FontWeight.w400, fontSize: 17),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                            Provider.of<CheckoutProvider>(
                                              context,
                                              listen: false,
                                            ).decreaseQuantity(index);
                                          },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.black),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.remove, size: 15,color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(item.quantity.toString()),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false,
                                          ).increaseQuantity(index);
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.black),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.add, size: 15, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: item.category, fontWeight: FontWeight.w400, fontSize: 15, fontColour: const Color(0xff8D95A3),),
                                  TextWidget(text: "£${double.parse(item.price) * item.quantity}", fontWeight: FontWeight.w400, fontSize: 15)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(text: "Total", fontWeight: FontWeight.w400, fontSize: 19),
                        const SizedBox(width: 150),
                        TextWidget(text:'£${total.toStringAsFixed(2)}', fontWeight: FontWeight.w400, fontSize: 21),
                        const SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color(0xff294458),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const TextWidget(text: "Checkout", fontWeight: FontWeight.w400, fontSize: 16, fontColour: Colors.white),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
