import 'package:flutter/material.dart';
import 'package:lighting_app/FavoritesPage.dart';
import 'package:lighting_app/ProductProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    final filteredProducts = productProvider.filteredProducts;
    final searchQuery = productProvider.searchQuery;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FortuneArrt Lighting'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => productProvider.setSearchQuery(value),
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchQuery.isNotEmpty
                  ? filteredProducts.length
                  : products.length,
              itemBuilder: (context, index) {
                final product = searchQuery.isNotEmpty
                    ? filteredProducts[index]
                    : products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.description),
                      Text('Price: Rs ${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => productProvider.toggleFavorite(product.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
