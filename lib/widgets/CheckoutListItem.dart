import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CheckoutModel.dart';
import 'TextWidget.dart';

class CheckoutListItem extends StatelessWidget {
  final CheckoutModel item;
  final int index;

  const CheckoutListItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
            margin: const EdgeInsets.all(8),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: item.productName, fontWeight: FontWeight.w400, fontSize: 17),
                  Row(
                    children: [
                      _QuantityButton(
                        icon: Icons.remove,
                        onTap: () {
                          Provider.of<CheckoutProvider>(
                            context,
                            listen: false,
                          ).decreaseQuantity(index);
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(item.quantity.toString()),
                      const SizedBox(width: 10),
                      _QuantityButton(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: Colors.black,
                        onTap: () {
                          Provider.of<CheckoutProvider>(
                            context,
                            listen: false,
                          ).increaseQuantity(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: item.category,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontColour: const Color(0xff8D95A3),
                  ),
                  TextWidget(
                    text: "£${(double.parse(item.price) * item.quantity).toStringAsFixed(2)}",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
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
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Icon(icon, size: 15, color: iconColor),
        ),
      ),
    );
  }
}
