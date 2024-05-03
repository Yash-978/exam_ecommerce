import 'package:exam_ecommerce/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DetailScreen'),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop('/');
            },
            child: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                child: Icon(Icons.shopping_cart_rounded)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                productList[selectedindex]['img'],
              )),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(productList[selectedindex]['name'],style: TextStyle(
                        fontSize: 25,color: Colors.orange
                      ),),
                      Text('\$'+productList[selectedindex]['price'].toString(),style: TextStyle(
                          fontSize: 25,color: Colors.red
                      ),),
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(productList[selectedindex]['dec'],style: TextStyle(
                        fontSize: 25),),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              bool status = false;
              for (int i = 0; i < cartList.length; i++) {
                if (cartList[i]['name'] == productList[selectedindex]['name']) {
                  index = i;
                  status = true;
                }
              }
              if (status == true) {
                cartList[index]['member']++;
              } else {
                cartList.add(productList[selectedindex]);
              }

              Navigator.of(context).pushNamed('/cart');
            },
            child: Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                  ),
                  Text(
                    'ADD TO CART',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
