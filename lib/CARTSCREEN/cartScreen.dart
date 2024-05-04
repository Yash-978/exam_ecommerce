

import 'package:exam_ecommerce/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('YOUR CART'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  cartList.length,
                  (index) => udfCart(
                    index,
                    img: cartList[index]['img'],
                    name: cartList[index]['name'],
                    price: cartList[index]['price'],
                    member: cartList[index]['member'],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     for (int i = 0; i < cartList.length; i++) {
                //       qty = (qty + cartList[i]['member']).toInt();
                //       amount =
                //           (amount + cartList[i]['price'] * (cartList[i]['member']));
                //     }
                //     total = ((amount) * 18 / 100) + amount;
                //     Navigator.pushNamed(context, '/check');
                //   },
                //   child: Container(
                //     height: 80,
                //     width: 400,
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //         color: Colors.black,
                //       ),
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.monetization_on,
                //           size: 30,
                //         ),
                //         Text(
                //           'Purchase',
                //           style: TextStyle(
                //             fontSize: 25,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              for (int i = 0; i < cartList.length; i++) {
                qty = (qty + cartList[i]['member']).toInt();
                amount =
                (amount + cartList[i]['price'] * (cartList[i]['member']));
              }
              total = ((amount) * 18 / 100) + amount;

              Navigator.pushNamed(context, '/check');
            },
            child: Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monetization_on,
                    size: 30,
                  ),
                  Text(
                    'Purchase',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget udfCart(int index,
      {required String img,
      required String name,
      required int price,
      required int member}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    cartList[index]['img'],
                  ),
                ),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartList[index]['name'],
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  cartList[index]['price'].toString(),
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (cartList[index]['member'] > 1) {
                            cartList[index]['member']--;
                          }
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: Text(
                          cartList[index]['member'].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cartList[index]['member']++;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  cartList.removeAt(index);
                  qty=0;
                  amount=0;
                  total=0;
                });
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                child: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
