import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/screens/auth/verify_code.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {

  final phoneNumberController = TextEditingController();

  final bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '032 9161 255'
              ),
            ),
            SizedBox(height: 80,),



          AuthButton(
                title: 'Đăng nhập',
                onTap: (){
                  auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_){

                      },
                      verificationFailed: (e){
                      Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_) => VerifyCodeScreen(verificationId: verificationId,)));
                      },
                      codeAutoRetrievalTimeout: (e){
                      Utils().toastMessage(e.toString());
                      });
                },
                loading: loading)
          ],
        ),
      ),
      );
  }
}
