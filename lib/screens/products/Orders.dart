import 'package:bonsai_shop/screens/products/productDetail.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Đơn hàng của tôi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen[900],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 110,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Row(
                children: [
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: SizedBox.fromSize(
                            size: Size.square(100),
                            child: Image.asset(
                              'lib/images/thantai.jpg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('200000 đ', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.lightGreen,
                            fontSize: 18
                        ),),
                        SizedBox(height: 10,),
                        Text('Thần tài',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                          ],
                        )
                      ],
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
}
