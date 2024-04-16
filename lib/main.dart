import 'package:addtocart/home.dart';
import 'package:addtocart/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: const MaterialApp(
        title: 'Smart Home',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false, 
        home: Home(),
      ),
    );
  }
}
