import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/screens/products/AllProducts.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bonsai_shop/screens/auth/login.dart';
import 'package:bonsai_shop/network/data.dart';
import '../products/productDetail.dart';
import 'SliderHome.dart';
import 'package:firebase_database/firebase_database.dart';


class Home extends StatefulWidget {
  final Post data;
  const Home({Key? key, required this.data,}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final auth = FirebaseAuth.instance;

  final ref = FirebaseDatabase.instance.ref('Post');

  final bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.lightGreen[900],
          centerTitle: true,
          title: const Text('Bonsai Shop'),
          actions: [
            IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                icon: const Icon(Icons.output)),
            SizedBox(width: 10,)
          ],
        ),
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
        body: Column(
          // physics: AlwaysScrollableScrollPhysics(),
          // padding: EdgeInsets.only(top: 20, bottom: 70),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                SliderHome(),


                // phân loại
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Bán chạy')),
                    ElevatedButton(onPressed: () {}, child: Text('Bán chạy')),
                    ElevatedButton(onPressed: () {}, child: Text('Bán chạy')),
                  ],
                ),


                // test
                // Expanded(child: StreamBuilder(
                //   stream: ref.onValue,
                //   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
                //     if(!snapshot.hasData){
                //       return Center(child: CircularProgressIndicator(),);
                //     } else {
                //       Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                //       List<dynamic> list = [];
                //       list.clear();
                //       list = map.values.toList();
                //
                //       final name = snapshot.data!.snapshot.value.toString();
                //
                //       return ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //           itemCount: snapshot.data!.snapshot.children.length,
                //           itemBuilder: (BuildContext context, int index){
                //             return InkWell(
                //               child: Container(
                //               width: 200,
                //               alignment: Alignment.center,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       child: Stack(
                //                         children: [
                //                           Container(
                //                             margin: const EdgeInsets.only(
                //                                 top: 5, left: 5, right: 5),
                //                             child: ClipRRect(
                //                               borderRadius:
                //                               const BorderRadius.all(
                //                                 Radius.circular(20),
                //                               ), // Image border
                //                               child: SizedBox.fromSize(
                //                                 size: const Size.square(
                //                                     230), // Image radius
                //                                 child: Image.network(list[index]['url'],
                //                                   width: double.infinity,
                //                                   fit: BoxFit.cover,
                //                                 ),
                //                               ),
                //                             ),
                //                           ),
                //                           Container(
                //                             margin: const EdgeInsets.only(
                //                                 left: 160, top: 10),
                //                             child: const Icon(
                //                               Icons.favorite,
                //                               color: Colors.greenAccent,
                //                               size: 30,
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                     Container(
                //                       margin:
                //                       EdgeInsets.only(left: 10, top: 10),
                //                       child: Text(
                //                         list[index]['name'],
                //                         style: const TextStyle(
                //                             fontSize: 18,
                //                             color: Colors.black,
                //                             fontWeight: FontWeight.w800),
                //                       ),
                //                     ),
                //                     Container(
                //                       margin: EdgeInsets.only(left: 10, top: 5),
                //                       child: Row(
                //                         children: [
                //                           const Icon(
                //                             Icons.location_on,
                //                             size: 20,
                //                             color: Colors.blue,
                //                           ),
                //                           Text(
                //                             list[index]['address'],
                //                             style: const TextStyle(
                //                                 color: Colors.blue,
                //                                 fontSize: 15),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Container(
                //                           margin: EdgeInsets.only(left: 10),
                //                           child: Text(
                //                             '${list[index]['price']} đ',
                //                             style: const TextStyle(
                //                                 fontSize: 18,
                //                                 fontWeight: FontWeight.w800),
                //                           ),
                //                         ),
                //
                //                       ],
                //                     )
                //                   ]),
                //             )
                //             );
                //           }
                //       );
                //
                //     }
                //   },
                // )),

                // Expanded(
                //     child: StreamBuilder(
                //       stream: ref.onValue,
                //       builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                //         if (!snapshot.hasData) {
                //           return const Center(
                //             child: CircularProgressIndicator(),
                //           );
                //         } else {
                //           Map<dynamic, dynamic> map =
                //           snapshot.data!.snapshot.value as Map<dynamic , dynamic>;
                //           List<dynamic> list = [];
                //           list.clear();
                //           list = map.values.toList();
                //
                //           return GridView.builder(
                //               physics: const ScrollPhysics(),
                //               itemCount: snapshot.data!.snapshot.children.length,
                //               gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 2,
                //                   mainAxisExtent: 270,
                //                   mainAxisSpacing: 20),
                //               itemBuilder: (context, index) {
                //                 return InkWell(
                //                   onTap: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (_) => ProductDetail(
                //                               data: list[index],
                //                             )));
                //                   },
                //                   child: Container(
                //                     margin:
                //                     const EdgeInsets.symmetric(horizontal: 10),
                //                     decoration: BoxDecoration(
                //                         boxShadow: [
                //                           BoxShadow(
                //                             color: Colors.grey.withOpacity(0.5),
                //                             spreadRadius: 1,
                //                             blurRadius: 10,
                //                             offset: const Offset(
                //                                 3, 3), // changes position of shadow
                //                           ),
                //                         ],
                //                         color: Colors.white,
                //                         borderRadius: const BorderRadius.all(Radius.circular(10))),
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.start,
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       mainAxisSize: MainAxisSize.max,
                //                       children: [
                //                         Container(
                //                           margin: const EdgeInsets.all(5),
                //                           child: ClipRRect(
                //                             borderRadius: const BorderRadius.all(Radius.circular(10)),
                //                             child: SizedBox.fromSize(
                //                                 size: const Size.square(170),
                //                                 child: Image.network(
                //                                   list[index]['url'],
                //                                   fit: BoxFit.cover,
                //                                   width: double.infinity,
                //                                 )),
                //                           ),
                //                         ),
                //                         Container(
                //                           padding: const EdgeInsets.symmetric(
                //                               horizontal: 10, vertical: 5),
                //                           child: Text(
                //                             list[index]['name'],
                //                             style: const TextStyle(
                //                                 fontWeight: FontWeight.w500,
                //                                 fontSize: 18),
                //                           ),
                //                         ),
                //                         Container(
                //                           padding: const EdgeInsets.symmetric(
                //                               horizontal: 10, vertical: 5),
                //                           child: Text(
                //                             list[index]['address'],
                //                             style: const TextStyle(
                //                                 color: Colors.grey,
                //                                 fontSize: 15,
                //                                 fontWeight: FontWeight.w300),
                //                           ),
                //                         ),
                //                         Container(
                //                           padding: const EdgeInsets.symmetric(horizontal: 10),
                //                           child: Row(
                //                             mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               SizedBox(
                //                                 child: Text(
                //                                   '${list[index]['price']} đ',
                //                                   style: const TextStyle(
                //                                       fontWeight: FontWeight.w600,
                //                                       fontSize: 18),
                //                                 ),
                //                               ),
                //                               const Icon(Icons.favorite_border)
                //                             ],
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                 );
                //               });
                //
                //
                //         }
                //       },
                //     )),




                // Sản phẩm bán chạy //


                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SẢN PHẨM BÁN CHẠY',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,

                          ),),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => AllProducts()));
                          },
                              child: Row(
                                children: [
                                  Text('Xem tất cả '),
                                  Icon(Icons.navigate_next)
                                ],
                              ))
                        ],
                      ),

                      Container(
                        height: 360,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5, left: 5, right: 5),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                      Radius.circular(20),
                                                    ), // Image border
                                                    child: SizedBox.fromSize(
                                                      size: const Size.square(
                                                          230), // Image radius
                                                      child: Image.asset(
                                                        data[index].image,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 160, top: 10),
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.greenAccent,
                                                    size: 30,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                            child: Text(
                                              data[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  size: 20,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  data[index].address,
                                                  style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  '${data[index].price}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 10),
                                                child: ElevatedButton(
                                                  onPressed: () {

                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) => ProductDetail(data: data.last)));
                                                  },
                                                  child: Text('Chi tiết'),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.greenAccent,
                                                    minimumSize: Size(0, 30),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  );
                                },
                                separatorBuilder: (context, _) => SizedBox(
                                  width: 10,
                                ),
                                itemCount: data.length)),
                      ),

                    ],
                  ),
                ),





              ],
            ),
          ],
        ));
  }
}

