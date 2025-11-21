// lib/pages/cart_home_page.dart
import 'package:flutter/material.dart';
import 'cart_grid_page.dart';

class CartHomePage extends StatelessWidget {
  const CartHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text("SweetBite Bakery"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
          child: const Text("Mulai Belanja"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartGridPage()),
            );
          },
        ),
      ),
    );
  }
}
