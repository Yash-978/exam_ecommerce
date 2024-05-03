

import 'package:flutter/material.dart';

import 'CARTSCREEN/cartScreen.dart';
import 'CHECKOUT/checkOut.dart';
import 'DETAILSCREEN/detailScreen.dart';
import 'HOMESCREEN/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: DetailScreen(),
        // home: homeScreen(),
        // home: CartScreen(),
        // home: checkout(),

        routes: {
          '/': (context) => Homescreen(),
          '/detail': (context) => DetailScreen(),
          '/cart': (context) => CartScreen(),
          '/check': (context) => checkout(),
        });
  }
}
