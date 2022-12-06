import 'package:bonsai_shop/screens/accounts/editProfile.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:bonsai_shop/screens/blog/upload_image.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/images/start1.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const Text(
                    'Tài khoản',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 200),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 45,
                        child: ClipOval(
                          child: (Image.asset(
                            'lib/images/avatar.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          )),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nguyễn Văn Thuận',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'anhthuan.221002@gmail.com',
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => EditProfile()));
                                  },
                                  child: const Text('Edit profile'))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                // quản lý đơn hàng
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => UploadImages()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20, top: 15),
                              child: (
                                  const Icon(Icons.document_scanner,
                                    color: Colors.grey,
                                    size: 30,
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            child: const Text(
                              'Quản lý đơn hàng',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5, top: 7),
                        child: IconButton(onPressed: (){},
                            icon: const Icon(Icons.navigate_next, color: Colors.grey, size: 30,)),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.black,
                ),

                //đổi mật khẩu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20, top: 15),
                            child: (
                                const Icon(Icons.key,
                                  color: Colors.grey,
                                  size: 30,
                                ))),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 15),
                          child: const Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5, top: 7),
                      child: IconButton(onPressed: (){},
                          icon: const Icon(Icons.navigate_next, color: Colors.grey, size: 30,)),
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.black,
                ),

                // ngôn ngữ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20, top: 15),
                            child: (
                                const Icon(Icons.language,
                                  color: Colors.grey,
                                  size: 30,
                                ))),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 15),
                          child: const Text(
                            'Ngôn ngữ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5, top: 7),
                      child: IconButton(onPressed: (){},
                          icon: const Icon(Icons.navigate_next, color: Colors.grey, size: 30,)),
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.black,
                ),

                // hotline
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20, top: 15),
                            child: (
                                const Icon(Icons.phone_android,
                                  color: Colors.grey,
                                  size: 30,
                                ))),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 15),
                          child: const Text(
                            'Hotline',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5, top: 7),
                      child: IconButton(onPressed: (){},
                          icon: const Icon(Icons.navigate_next, color: Colors.grey, size: 30,)),
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.black,
                ),

                // đăng xuất

                InkWell(
                  onTap: () {
                    auth.signOut().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 20, top: 15),
                              child: (
                                  const Icon(Icons.output_outlined,
                                    color: Colors.grey,
                                    size: 30,
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            child: const Text(
                              'Đăng xuất',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5, top: 7),
                        child: IconButton(onPressed: (){},
                            icon: const Icon(Icons.navigate_next, color: Colors.grey, size: 30,)),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
