import 'package:bonsai_shop/screens/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   backgroundColor: Colors.red,
      // ),
      body: ListView(
        children: [
          Container(
            width: 340,
            margin: const EdgeInsets.only(left: 36, right: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 300, bottom: 50),
                  child: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                // text fiel
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    labelText: 'Email',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    labelText: 'Password',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    labelText: 'Confirm Password',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  // style: OutlinedButton.styleFrom(minimumSize: Size(320, 50)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      )
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: const Text(
                    'Sign up',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),

                const SizedBox(
                  height: 100,
                ),

                const Text(
                  '- Do sign in with -',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child:
                          Icon(Icons.facebook, size: 40, color: Colors.indigo),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.g_mobiledata,
                        size: 50,
                        color: Colors.deepOrange,
                      ),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.telegram,
                        size: 40,
                        color: Colors.blue,
                      ),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.white),
                    )
                  ],
                ),

                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
