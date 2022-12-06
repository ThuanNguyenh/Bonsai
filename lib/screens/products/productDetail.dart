import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/network/data.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:flutter/material.dart';




class ProductDetail extends StatefulWidget {

  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  final bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        title: const Text('Chi tiết sản phẩm'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('lib/images/thantai.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Container(
                width: double.infinity,
                decoration:const BoxDecoration(
                    color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Thần tài',
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
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        '200000 đ',
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
                        'Cây ngọc ngân còn gọi là cây Valentine, có tên danh pháp là Dieffenbachia Picta, thuộc họ Ráy, thuộc loài thân thảo, có nguồn gốc ở Châu Mỹ nhiệt đới, Trung Mỹ, Brazil,... và ở Đông Nam Á thì cây được trồng nhiều Trung Quốc, Việt Nam,...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: AuthButton(
                          title: 'Thêm vào giỏ hàng',
                          onTap: (){},
                          loading: loading
                      ),
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

