class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });

  Product toggleFavorite() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      isFavorite: !isFavorite,
    );
  }
}
