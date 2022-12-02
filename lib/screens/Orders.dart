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
      ),

      body: ListView(
        children: [
          Container(
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
                            'lib/images/start2.png',
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
                      Text('\$600,00', style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.lightGreen,
                        fontSize: 18
                      ),),
                      SizedBox(height: 10,),
                      Text('Lan đột biến',style: TextStyle(
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
          )
        ],
      ),

    );
  }
}
