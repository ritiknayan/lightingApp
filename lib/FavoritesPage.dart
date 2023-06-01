import 'package:flutter/material.dart';
import 'package:lighting_app/ProductProvider.dart';
import 'package:provider/provider.dart';




class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProducts = productProvider.favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        title:const  Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description),
                Text('Price: \$${product.price.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
