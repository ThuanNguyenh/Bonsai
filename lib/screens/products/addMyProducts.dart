
import 'dart:io';

import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddBlogs extends StatefulWidget {
  const AddBlogs({Key? key}) : super(key: key);


  @override
  State<AddBlogs> createState() => _AddBlogsState();
}

class _AddBlogsState extends State<AddBlogs> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final addressController = TextEditingController();
  final titleController = TextEditingController();




  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  // upload image
  File? _image ;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  // DatabaseReference databaseImageRef = FirebaseDatabase.instance.ref('Post');

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
        title:const Text('Thêm sản phẩm mới'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 25,),

                // upload image
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
                                color: Colors.lightGreen,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: _image != null ? Image.file(_image!.absolute) : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(Icons.image, color: Colors.lightGreen,),
                              Text('Thêm hình ảnh', style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 15,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        TextFormField(
                          maxLines: 1,
                          maxLength: 15,
                          controller: titleController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Loại sản phẩm',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),

                        TextFormField(
                          maxLines: 1,
                          maxLength: 15,
                          controller: nameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Tên sản phẩm',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),

                        TextFormField(
                          maxLines: 4,
                          controller: descriptionController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'mô tả',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                        TextFormField(
                          maxLines: 1,
                          controller: priceController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Giá bán',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),

                        TextFormField(
                          maxLines: 1,
                          controller: addressController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Địa chỉ',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                            ),
                          ),
                        ),


                      ],
                    )),

                const SizedBox(height: 60,),

                AuthButton(
                    title: 'Đăng bán',
                    onTap: ()async{
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          loading = true;
                        });


                        // upload image
                        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref(
                            '/foldername/${DateTime.now().millisecondsSinceEpoch}'
                        );
                        firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

                        await Future.value(uploadTask);
                        var newUrl = await ref.getDownloadURL();


                        String id = DateTime.now().millisecondsSinceEpoch.toString() ;

                        databaseRef.child(id).set({
                          'id': id,
                          'title' : titleController.text.toString(),
                          'url': newUrl.toString(),
                          'name': nameController.text.toString(),
                          'description': descriptionController.text.toString(),
                          'price': priceController.text.toString(),
                          'address': addressController.text.toString(),


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
                    loading: loading),
                SizedBox(height: 60,)
              ],
            ),
          )
        ],
      ),
    );
  }


}
