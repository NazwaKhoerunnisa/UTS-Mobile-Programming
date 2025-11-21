import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_summary_page.dart';

class CartGridPage extends StatelessWidget {
  CartGridPage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      id: "1",
      name: "Chocolate Cake",
      price: 45000,
      image: "https://images.unsplash.com/photo-1601972599720-b3fa6a1a29df?auto=format&fit=crop&w=800&q=80",
    ),
    ProductModel(
      id: "2",
      name: "Vanilla Cupcake",
      price: 20000,
      image: "https://images.unsplash.com/photo-1599785209707-28f1d37b04ca?auto=format&fit=crop&w=800&q=80",
    ),
    ProductModel(
      id: "3",
      name: "Cheesecake Slice",
      price: 30000,
      image: "https://images.unsplash.com/photo-1596495578065-3b464e16d85d?auto=format&fit=crop&w=800&q=80",
    ),
    ProductModel(
      id: "4",
      name: "Red Velvet Cake",
      price: 50000,
      image: "https://images.unsplash.com/photo-1606313657560-e6f29af3e8d3?auto=format&fit=crop&w=800&q=80",
    ),
    ProductModel(
      id: "5",
      name: "Choco Donut",
      price: 12000,
      image: "https://images.unsplash.com/photo-1542834759-13e252a1b500?auto=format&fit=crop&w=800&q=80",
    ),
    ProductModel(
      id: "6",
      name: "Strawberry Tart",
      price: 35000,
      image: "https://images.unsplash.com/photo-1499636136210-6f4ee915583e?auto=format&fit=crop&w=800&q=80",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Daftar Produk SweetBite"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartSummaryPage()),
              );
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.74),
        itemBuilder: (_, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
