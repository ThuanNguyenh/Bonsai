import 'package:bonsai_shop/network/data.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:flutter/material.dart';




class ProductDetail extends StatefulWidget {

  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen[900],
        title: const Text('Chi tiết sản phẩm'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 320,
                child: Image.asset('lib/images/start1.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Container(
                height: 465,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 300),
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lan dot bien',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        '150000 d',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: const Text(
                        'Plant Shop Mobile App designed by Fauzan Ardhiansyah for Enver Studio.'
                            ' Connect with them on Dribbble; the global community for designers and creative professionals.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 130),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.lightGreen,
                            minimumSize: const Size(400, 45),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => const Login()));
                          },
                          child: const Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

