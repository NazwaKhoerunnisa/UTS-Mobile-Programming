// lib/pages/cart_summary_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        backgroundColor: Colors.brown,
      ),
      body: BlocBuilder<CartCubit, List<Map<String, dynamic>>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: Text("Keranjang kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: state.map((item) {
                    final product = item['product'];
                    final qty = (item['qty'] as num).toInt();

                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(product.image, width: 56, height: 56, fit: BoxFit.cover),
                      ),
                      title: Text(product.name),
                      subtitle: Text("Qty: $qty"),
                      trailing: Text("Rp ${product.price * qty}"),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Item : ${context.read<CartCubit>().getTotalItems()}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "Total Harga : Rp ${context.read<CartCubit>().getTotalPrice()}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().clearCart();
                },
                child: const Text("Checkout"),
              ),
              const SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}
