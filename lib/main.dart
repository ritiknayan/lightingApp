import 'package:flutter/material.dart';
import 'package:lighting_app/HomePage.dart';
import 'package:lighting_app/ProductProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: const MaterialApp(
        title: 'FortuneArrt LED Lighting',
        home: HomePage(),
      ),
    );
  }
}
