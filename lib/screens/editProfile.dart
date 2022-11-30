import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Colors.lightGreen[900], fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 16),
              ))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightGreen[900]),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                      child: (Image.asset(
                        'lib/images/start1.jpg',
                        fit: BoxFit.cover,
                        width: 140,
                        height: 140,
                      )),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Thay đổi hình đại diện')),

                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    labelText: 'Họ và tên',
                  ),
                ),
                const SizedBox(height: 10,),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10,),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    labelText: 'Thành phố/Tỉnh',
                  ),
                ),
                const SizedBox(height: 10,),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    labelText: 'Giới tính',
                  ),
                ),
                SizedBox(height: 100,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(362, 50),
                        primary: Colors.lightGreen[900]
                    ),
                    onPressed: (){},
                    child: Text('Cập nhật',
                      style: TextStyle(fontSize: 18),))
              ],
            ),
          )
        ],

      ),
    );
  }
}
