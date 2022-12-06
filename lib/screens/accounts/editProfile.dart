import 'dart:io';

import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  // Initial Selected Value
  String dropdownvalue = 'Nam';

  // List of items in our dropdown menu
  var items = [
    'Nam',
    'Nữ',
    'Khác',
  ];

  bool loading = false;
  final ref = FirebaseDatabase.instance.ref('User');

  // edit user
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Image');

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


  Future<void> edit(
    String name,
    String email,
    String address,
  ) async {
    nameController.text = name;
    emailController.text = email;
    addressController.text = address;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Colors.lightGreen, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.lightGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [
          Center(
            child: Column(
              children: [

                InkWell(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          child: ClipOval(
                            child: _image != null ? Image.file(_image!.absolute)
                                : (Image.asset(
                              'lib/images/avatar.jpg',
                              fit: BoxFit.fill,
                              width: 140,
                              height: 140,
                            )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 130, left: 60),

                        child:  Icon(Icons.edit_calendar, color: Colors.blue,),
                      )
                    ],
                  ),
                  onTap: (){
                    getImageGallery();
                  },
                ),


                SizedBox(height: 25,),

                Form(
                  key: _formKey,
                    child: Column(
                      children: [

                        // name
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 10,
                                    offset: Offset(3,3),
                                    spreadRadius: 5
                                )
                              ]
                          ),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Vui lòng nhập tên';
                              } else {
                                return null;
                              }
                            },
                            decoration:const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                hintText: 'Tên người dùng',
                            ),

                          ),
                        ),


                        const SizedBox(height: 15,),

                        // email
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 10,
                                    offset: Offset(3,3),
                                    spreadRadius: 5
                                )
                              ]
                          ),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty){
                                return 'Vui lòng nhập email';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                hintText: 'email',
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),

                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 10,
                                    offset: Offset(3,3),
                                    spreadRadius: 5
                                )
                              ]
                          ),
                          child: TextFormField(
                            controller: addressController,
                            validator: (value) {
                              if (value!.isEmpty){
                                return 'Vui lòng nhập địa chỉ';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                hintText: 'Địa chỉ',
                            ),
                          ),
                        ),
                      ],
                    )),



                const SizedBox(height: 20,),

                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 10,
                        offset: Offset(3,3),
                        spreadRadius: 5
                      )
                    ]
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Initial Value
                      value: dropdownvalue,

                      // Array list of items

                      items: items.map((String items) {
                        return DropdownMenuItem(

                          child: Text(items),

                          value: items,
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 100,),

               AuthButton(
                   title: 'Cập nhật',
                   onTap: (){
                     if (_formKey.currentState!.validate()){
                       setState(() {
                         loading = true;
                       });

                     }
                   },
                   loading: loading
               )
              ],
            ),
          )
        ],

      ),
    );
  }
}
