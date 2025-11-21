import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Rp ${product.price}",
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          SizedBox(height: 6),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
            onPressed: () {
              context.read<CartCubit>().addToCart(product);
            },
            child: Text("Tambah"),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
