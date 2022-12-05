import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  // show the password or not
  bool _isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text('Tạo tài khoản'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Image.asset('lib/images/logo.png'),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // text fiel
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Vui lòng nhập email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(const Radius.circular(10))
                                // borderSide: BorderSide(color: Colors.blue, width: .5)
                              ),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: _isObscure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Vui lòng nhập mật khẩu';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              labelText: 'Mật khẩu',
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 40,
                  ),

                  AuthButton(
                      title: 'Đăng ký',
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            loading = true ;
                          });

                          _auth.createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString()).then((value) {
                            setState(() {
                              loading = false;
                            });
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                      loading: loading),



                  const SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Bạn đã có tài khoản? ',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Login()));
                          },
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.lightGreen
                            ),
                          )),
                    ],
                  ),



                ],
              ),
            ),
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

