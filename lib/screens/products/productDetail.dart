import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/network/data.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:flutter/material.dart';


// chi tiêts sản phẩm


class ProductDetail extends StatefulWidget {
  final Post? data;
  const ProductDetail({Key? key, required this.data}) : super(key: key);

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
        title: Text('Chi tiết sản phẩm'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  FadeInImage(
                      placeholder: AssetImage('lib/images/start2.png'),
                      image: AssetImage(data[index].image)),


                  Container(
                    height: 372,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 450),
                    decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '\$ ${data[index].price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
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
                          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Colors.lightGreen[900],
                                minimumSize: Size(400, 45),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => Login()));
                              },
                              child: const Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(124, 252, 0, 0.7),
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
          );
        },
      ),
    );
  }
}

