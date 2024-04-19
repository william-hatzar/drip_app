import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  final bool favorite;
  final Function(bool) onFavoriteChanged;

  const FavouriteWidget({Key? key, required this.favorite, required this.onFavoriteChanged}) : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 300,
      right: 0,
      bottom: 700,
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
            widget.onFavoriteChanged(isFavorite);
          });
        },
        icon: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
