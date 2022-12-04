

import 'dart:io';

import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);


  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  final _formKey = GlobalKey<FormState>();
  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection("users");

  // upload image
  File? _image ;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');

  Future getImageGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }else {
        print('no image picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm sản phẩm'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 15,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: (){
                      getImageGallery();
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: _image != null ? Image.file(_image!.absolute) :const Icon(Icons.image),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),

              ],
            ),

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
                onTap: ()async{
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });

                    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref(
                        '/foldername/${DateTime.now().millisecondsSinceEpoch}'
                    );
                    firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

                    await Future.value(uploadTask);
                    var newUrl = await ref.getDownloadURL();

                    databaseRef.child('1').set({
                      'id': '1212',
                      'title' : newUrl.toString()
                    });

                    String id = DateTime.now().millisecondsSinceEpoch.toString();
                    fireStore.doc(id).set({
                      'title': postController.text.toString(),
                      'id' : id,
                    }).then((value) {
                      Utils().toastMessage('them thanh cong!');
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
