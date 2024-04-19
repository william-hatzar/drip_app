import 'package:drip_app/widgets/TrashCanWidget.dart';
import 'package:flutter/material.dart';
import 'package:drip_app/models/FavoritesModel.dart';
import 'package:drip_app/models/ProductModelSInk.dart';

class DismissibleFavoriteCard extends StatelessWidget {
  final FavoritesModel favoriteProduct;
  final ProductProvider productProvider;
  final Function() onDismissed;
  final Widget child;

  const DismissibleFavoriteCard({
    Key? key,
    required this.favoriteProduct,
    required this.productProvider,
    required this.onDismissed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: const TrashCanWidget(imagePath: "images/trash_icon.png"),
      onDismissed: (_) {
        onDismissed();
      },
      child: child,
    );
  }
}
