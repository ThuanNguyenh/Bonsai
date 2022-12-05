import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TypeProducts extends StatefulWidget {
  const TypeProducts({Key? key}) : super(key: key);

  @override
  State<TypeProducts> createState() => _TypeProductsState();
}

class _TypeProductsState extends State<TypeProducts> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY PHONG THỦY', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/thuy.png',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY NGÀY TẾT', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/ngaytet.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.lightGreen[400],
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY TRƯNG BÀY', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/trungbay.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY KHẤN TẾ', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/khante.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.lightGreen[200],
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY VĂN PHÒNG', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/vanphong.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent[100],
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('CÂY GIÁNG SINH', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: 0),
                      child: ClipRRect(
                        child: SizedBox.fromSize(
                          size: Size.square(100),
                          child: Image.asset('lib/images/giangsinh.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}