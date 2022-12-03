import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:bonsai_shop/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainHome())));
}

class MainProvider extends ChangeNotifier {}

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // banner
            Container(
              child: Image.asset(
                'lib/images/start1.jpg',
                fit: BoxFit.fill,
                color: const Color.fromRGBO(156, 156, 156, 1),
                colorBlendMode: BlendMode.modulate,
                width: double.infinity,
                height: 900,
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
              margin: const EdgeInsets.only(top: 700, left: 100, right: 80),
              child: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.white,
                      minimumSize: Size(200, 45),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
