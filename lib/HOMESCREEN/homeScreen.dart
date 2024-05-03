import 'package:exam_ecommerce/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomeScren'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.search,
                    size: 25,
                  ),
                  Text(
                    'Search your Product',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: 170,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('Asset/Images/poster5.jpg')),
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Text(
                      'Wrist',
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                  Container(
                    height: 70,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Text(
                      'wall',
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                  Container(
                    height: 70,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Text(
                      'pendulam clock',
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                  Container(
                    height: 70,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Text(
                      'classic',
                      style: TextStyle(fontSize: 25),
                    )),
                  )
                ],
              ),
            ),
            Wrap(
              children: [
                ...List.generate(
                  productList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                        Navigator.of(context).pushNamed('/detail');
                      });
                    },
                    child: udfproduct(
                      name: productList[index]['name'],
                      dec: productList[index]['dec'],
                      price: productList[index]['price'],
                      img: productList[index]['img'],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget udfproduct({
    required String name,
    required String dec,
    required int price,
    required String img,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text(
                    '5',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              width: 195,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  price.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
