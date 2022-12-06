import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:bonsai_shop/screens/auth/login_with_phone_number.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
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
  final userNameController = TextEditingController();



  FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref('User');

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
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                            controller: userNameController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Vui lòng nhập tên đăng nhập';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.lightGreen),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(const Radius.circular(10))
                                // borderSide: BorderSide(color: Colors.blue, width: .5)
                              ),
                              labelText: 'Tên đăng nhập',
                              prefixIcon: Icon(Icons.person)
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

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
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(const Radius.circular(10))
                                  // borderSide: BorderSide(color: Colors.blue, width: .5)
                                ),
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)
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
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(const Radius.circular(10))
                                  // borderSide: BorderSide(color: Colors.blue, width: .5)
                                ),
                                labelText: 'Mật khẩu',
                                prefixIcon: Icon(Icons.key)
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


                          // save User
                          String id = DateTime.now().millisecondsSinceEpoch.toString();


                          databaseRef.child(id).set({
                            'id': id,
                            'username': userNameController.text.toString(),
                            'email': emailController.text.toString(),
                            'password': passwordController.text.toString(),
                          });


                          // save account
                          _auth.createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString()

                          ).then((value) {
                            Utils().toastMessage('Đăng ký thành công!');
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

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPhone()));
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.lightGreen
                          )
                      ),
                      child:Center(child: Text('Đăng nhập với số điện thoại',
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16
                        ),)),
                    ),

                  )

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

