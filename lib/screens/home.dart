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
  List<CardItem> items = [
    CardItem(image: "lib/image/start2.png"),
    CardItem(image: "lib/image/start2.png"),
    CardItem(image: "lib/image/start2.png"),
    CardItem(image: "lib/image/start2.png"),
    CardItem(image: "lib/image/start2.png"),
    CardItem(image: "lib/image/start2.png"),
  ];

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
                      borderRadius: BorderRadius.circular(15),
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
                      mainAxisExtent: 250,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => buildCard()),
              )
            ],
          )),
    );
  }

  Widget buildCard() => Container(
        // color: Colors.white,
        alignment: Alignment.center,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)), // Image border
              child: SizedBox.fromSize(
                size: Size.fromHeight(250), // Image radius
                child: Image.asset('lib/images/start1.jpg', fit: BoxFit.cover),
              ),
            )


          ]
        ),
      );
}
