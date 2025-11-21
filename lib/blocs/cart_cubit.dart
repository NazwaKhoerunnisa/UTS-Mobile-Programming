// lib/blocs/cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(ProductModel product) {
    final index = state.indexWhere((item) => item['product'].id == product.id);

    if (index == -1) {
      emit([...state, {'product': product, 'qty': 1}]);
    } else {
      final newState = [...state];
      final currentQty = (newState[index]['qty'] as num).toInt();
      newState[index]['qty'] = currentQty + 1;
      emit(newState);
    }
  }

  void removeFromCart(ProductModel product) {
    emit(state.where((item) => item['product'].id != product.id).toList());
  }

  void updateQuantity(ProductModel product, int qty) {
    final newState = [...state];
    final index = newState.indexWhere((item) => item['product'].id == product.id);

    if (index != -1) {
      newState[index]['qty'] = qty;
      emit(newState);
    }
  }

  int getTotalItems() {
    int total = 0;
    for (var item in state) {
      total += (item['qty'] as num).toInt();
    }
    return total;
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in state) {
      int qty = (item['qty'] as num).toInt();
      int price = (item['product'].price as num).toInt();
      total += qty * price;
    }
    return total;
  }

  void clearCart() {
    emit([]);
  }
}
