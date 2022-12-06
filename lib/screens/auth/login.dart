import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/homepage.dart';
import 'package:bonsai_shop/screens/auth/login_with_phone_number.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bonsai_shop/screens/auth/signup.dart';
import 'package:bonsai_shop/screens/auth/forgot_password.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final _auth = FirebaseAuth.instance;

  // show the password or not
  bool _isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true ;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()
    ).then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      setState(() {
        loading = false ;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false ;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
         body: ListView(
           children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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

                                 validator: (value){
                                   if(value!.isEmpty){
                                     return 'Vui lòng nhập email';
                                   }
                                   return null;
                                 },
                                 decoration: const InputDecoration(
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(const Radius.circular(10))
                                   ),
                                   labelText: 'Email',
                                   prefixIcon: Icon(Icons.email),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     borderSide: BorderSide(color: Colors.lightGreen)
                                   )
                                 ),
                               ),
                               const SizedBox(
                                 height: 20,
                               ),
                               TextFormField(
                                 keyboardType: TextInputType.text,
                                 controller: passwordController,

                                 obscureText: _isObscure,
                                 validator: (value){
                                   if(value!.isEmpty){
                                     return 'Vui lòng nhập mật khẩu';
                                   }
                                   return null;
                                 },
                                 decoration: const InputDecoration(
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.all(const Radius.circular(10))
                                     ),
                                     labelText: 'Mật khẩu',
                                     prefixIcon: Icon(Icons.key),
                                     focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                         borderSide: BorderSide(color: Colors.lightGreen)
                                     )
                                 ),
                               ),


                             ],
                           )),
                       const SizedBox(
                         height: 10,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           TextButton(
                               onPressed: () {
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (_) => const ForgotPassword()));
                               },
                               child: const Text(
                                 'Quên mật khẩu?',
                                 style: TextStyle(
                                     fontSize: 16,
                                     fontWeight: FontWeight.normal,
                                     color: Colors.lightGreen
                                 ),
                               )),
                         ],
                       ),

                       const SizedBox(height: 20,),

                       AuthButton(
                           title: 'Đăng nhập',
                           onTap: (){
                             if(_formKey.currentState!.validate()){
                               login();
                             }
                           },
                           loading: loading),

                       const SizedBox(height: 20),


                       const SizedBox(
                         height: 30,
                       ),


                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Text(
                             'Bạn chưa có tài khoản? ',
                             style: TextStyle(fontSize: 16, color: Colors.grey),
                           ),
                           TextButton(
                               onPressed: () {
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (_) => const SignUp()));
                               },
                               child: const Text(
                                 'Đăng ký',
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
                   )
               ),
             ),
           ],

         )

          // This trailing comma makes auto-formatting nicer for build methods.
        )
        );
  }
}
