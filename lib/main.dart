import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bonsai_shop/screens/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainHome())));
}

class MainProvider extends ChangeNotifier {
}

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // banner
            Container(
              child: Image.asset(
                'lib/images/start1.jpg',
                fit: BoxFit.fill,
                height: 900,
                width: 600,
              ),
            ),

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200, left: 30, right: 100),
                  child: const Text(
                    'Welcome to Bonsai Shop',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 70),
                  child: const Text(
                    'Feel fresh a with bonsai plants. It will enhance your living space!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),

            // content
            Container(
              margin: const EdgeInsets.only(top: 700, left: 30, right: 30),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1),
                      minimumSize: Size(200, 45)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Get stated',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: const[
                          Icon(Icons.navigate_next, color: Colors.white),
                          Icon(Icons.navigate_next, color: Colors.white60),
                          Icon(Icons.navigate_next, color: Colors.white54)
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}


