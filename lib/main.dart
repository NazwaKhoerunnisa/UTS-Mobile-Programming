// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart_cubit.dart';
import 'pages/cart_home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CartCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SweetBite Bakery',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF6F1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8B5E3C),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5E3C)),
        ),
      ),
      home: const CartHomePage(),
    );
  }
}
