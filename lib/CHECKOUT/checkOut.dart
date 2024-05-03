import 'package:exam_ecommerce/List.dart';
import 'package:flutter/material.dart';
class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('YOUR BILL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('AMOUNT :) '+'$amount',style: TextStyle(
              fontSize: 25
            ),),
            Text('Quantity :)  '+'$qty',style: TextStyle(
              fontSize: 25,
            ),),
            Text('18% with GST ',style: TextStyle(
              fontSize: 25
            ),),
            Text('TOTAl  :) '+'$total',style: TextStyle(
              fontSize: 25
            ),),
          ],
        ),
      ),
    );
  }
}
