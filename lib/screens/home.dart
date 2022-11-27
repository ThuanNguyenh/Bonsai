import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:bonsai_shop/screens/login.dart';

class CardItem {
  final String image;

  const CardItem({required this.image});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // get index => 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen[900],
        centerTitle: true,
        title: const Text('Bonsai Shop'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Find bonsai you like',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: postData.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        // color: Colors.white,
                        alignment: Alignment.center,
                        // height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.square(170), // Image radius
                                          child: Image.network(
                                            '${postData[index].image}',
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 130, top: 10),
                                      child:const Icon(
                                        Icons.favorite,
                                        color: Colors.greenAccent,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Text('${postData[index].name}',
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, size: 20, color: Colors.blue,),
                                    Text('${postData[index].address}',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('\$ ${postData[index].price}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800
                                      ),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: ElevatedButton(onPressed: () {  },
                                      child: Icon(Icons.add_shopping_cart),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.greenAccent,
                                        minimumSize: Size(0, 30),
                                      ),

                                    ),
                                  )
                                ],
                              )
                            ]),
                      );
                    }),
              )
            ],
          )),
    );
  }

  List<Post> postData = [];

 @override
 void initState() {
   super.initState();
   NetworkRequest.fetchPosts().then((dataFromServer) {
     setState(() {
       postData = dataFromServer;
     });
   });
 }
}
