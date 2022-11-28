import 'package:flutter/material.dart';
import 'package:bonsai_shop/main.dart';
import 'package:provider/provider.dart';
import 'package:bonsai_shop/screens/signup.dart';
import 'package:bonsai_shop/homepage.dart';
import 'package:bonsai_shop/screens/password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  // show the password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // // appBar: AppBar(
      // //   title: const Text('Login'),
      // //   backgroundColor: Colors.red,
      // ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60, left: 36, right: 36),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
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
                        // borderSide: BorderSide(color: Colors.blue, width: .5)
                        ),
                    labelText: 'Email',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),

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
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: const Text(
                    'Sign in',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PassWord()));
                }, child: const Text('Forgot your password?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),)),

                const SizedBox(
                  height: 70,
                ),

                const Text(
                  ' - Do sign in with - ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.facebook,
                        size: 40, color: Colors.indigo,
                      ),
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(100, 50),
                            backgroundColor: Colors.white
                          ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.g_mobiledata,
                        size: 50,
                        color: Colors.deepOrange,
                      ),
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(100, 50),
                          backgroundColor: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.telegram,
                        size: 40,
                        color: Colors.blue,
                      ),
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(100, 50),
                          backgroundColor: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 70,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
