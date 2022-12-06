import 'dart:async';

import 'package:bonsai_shop/screens/products/productDetail.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late Timer _timer;
  var _weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Đơn hàng của tôi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 110,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white38,
                    offset: Offset(3.0, 3.0),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  )
                ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProductDetail()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                                child: SizedBox.fromSize(
                                    size: const Size.square(100),
                                    child: Image.asset(
                                      'lib/images/thantai.jpg',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ProductDetail()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '200000 đ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.lightGreen,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Thần tài',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text('2'),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius:
                                BorderRadius.all(const Radius.circular(5))),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
