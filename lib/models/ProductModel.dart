class ProductsModel {

  final String productName;
  final String colour;
  final String category;
  final String price;
  final String rating;
  final String imageUrl;
  final int reviews;
  final String description;
  bool isFavourite;


  ProductsModel({required this.productName, required this.colour, required this.category, required this.price, required this.rating, required this.imageUrl, required this.description, required this.reviews, this.isFavourite = false});

  // Method to toggle the favorite status
  ProductsModel toggleFavorite() {
    return ProductsModel(
      productName: productName,
      colour: colour,
      category: category,
      price: price,
      rating: rating,
      imageUrl: imageUrl,
      reviews: reviews,
      description: description,
      isFavourite: isFavourite
    );
  }
}