import 'package:flutter/material.dart';
import 'package:lighting_app/Product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Product 1',
      description: 'This is product 1',
      price: 15,
    ),
    Product(
      id: '2',
      name: 'Product 2',
      description: 'This is product 2',
      price: 25,
    ),
    Product(
      id: '3',
      name: 'Product 3',
      description: 'This is product 3',
      price: 51,
    ),
    Product(
      id: '4',
      name: 'Product 4',
      description: 'Description of Product 1',
      price: 60,
    ),
    Product(
      id: '5',
      name: 'Product 5',
      description: 'Description of Product 2',
      price: 899,
    ),
    Product(
      id: '6',
      name: 'Product 6',
      description: 'Description of Product 1',
      price: 30,
    ),
    Product(
      id: '7',
      name: 'Product 7',
      description: 'Description of Product 2',
      price: 19.99,
    ),
    Product(
      id: '8',
      name: 'Product 8',
      description: 'Description of Product 1',
      price: 9.99,
    ),
    Product(
      id: '9',
      name: 'Product 9',
      description: 'Description of Product 2',
      price: 19.99,
    ),
    Product(
      id: '10',
      name: 'Product 10',
      description: 'Description of Product 1',
      price: 9.99,
    ),
    Product(
      id: '11',
      name: 'Product 11',
      description: 'Description of Product 2',
      price: 19.99,
    ),
    Product(
      id: '12',
      name: 'Product 12',
      description: 'Description of Product 1',
      price: 9.99,
    ),
    Product(
      id: '13',
      name: 'Product 13',
      description: 'Description of Product 2',
      price: 19.99,
    ),
    Product(
      id: '14',
      name: 'Product 14',
      description: 'Description of Product 1',
      price: 75,
    ),
    Product(
      id: '15',
      name: 'Product 15',
      description: 'Description of Product 2',
      price: 199,
    ),
    Product(
      id: '16',
      name: 'Product 16',
      description: 'Description of Product 1',
      price: 499,
    ),
    Product(
      id: '17',
      name: 'Product 17',
      description: 'Description of Product 2',
      price: 999,
    ),
    Product(
      id: '18',
      name: 'Product 18',
      description: 'Description of Product 1',
      price: 49,
    ),
    Product(
      id: '19',
      name: 'Product 19',
      description: 'Description of Product 2',
      price: 99,
    ),
    Product(
      id: '20',
      name: 'Product 20',
      description: 'Description of Product 1',
      price: 18,
    ),
  ];

  String _searchQuery = '';
  bool _showFavoritesOnly = false;

  List<Product> get products {
    if (_showFavoritesOnly) {
      return _products.where((product) => product.isFavorite).toList();
    } else {
      return _products;
    }
  }

  List<Product> get filteredProducts {
    if (_searchQuery.isEmpty) {
      return products;
    } else {
      return products
          .where((product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavoritesOnly(bool value) {
    _showFavoritesOnly = value;
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    final productIndex =
        _products.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      _products[productIndex] = _products[productIndex].toggleFavorite();
      notifyListeners();
    }
  }
}
