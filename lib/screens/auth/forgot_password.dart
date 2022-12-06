
import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  late bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Quên mật khẩu'),
        backgroundColor: Colors.lightGreen,
      ),

      body: ListView(
        children: [
          Padding(padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Form(
                key: _formKey,
                  child: TextFormField(
                    decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value!.isEmpty){
                        return 'Vui lòng nhập email';
                      } else {
                        return null;
                      }
                    },
                  )),

              const SizedBox(height: 50,),

              AuthButton(
                  title: 'Lấy lại mật khẩu',
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      auth.sendPasswordResetEmail(
                          email: emailController.text.toString()
                      ).then((value) {
                        Utils().toastMessage('Vui lòng kiểm tra email để lấy lại mật khẩu');
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
                  loading: loading)
            ],
          ),)
        ],
      ),
    );
  }
}
