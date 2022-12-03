
import 'dart:ffi';

import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddBlogs extends StatefulWidget {
  const AddBlogs({Key? key}) : super(key: key);


  @override
  State<AddBlogs> createState() => _AddBlogsState();
}

class _AddBlogsState extends State<AddBlogs> {

  final _formKey = GlobalKey<FormState>();
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo bài viết mới'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Form(
              key: _formKey,
              child: TextFormField(
              maxLines: 4,
              controller: postController,
              validator: (value){
                if(value!.isEmpty){
                  return 'Hãy nhập nội dung !';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Bạn đang nghĩ gì?',
                border: OutlineInputBorder(),
              ),
            ),),
            const SizedBox(height: 20,),

            AuthButton(
                title: 'Thêm',
                onTap: (){
                 if(_formKey.currentState!.validate()){
                   setState(() {
                     loading = true;
                   });

                   String id = DateTime.now().millisecondsSinceEpoch.toString() ;

                   databaseRef.child(id).set({
                     'id': id,
                     'title': postController.text.toString()

                   }).then((value){
                     Utils().toastMessage('Thêm thành công!');
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
        ),
      ),
    );
  }


}
