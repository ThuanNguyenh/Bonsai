import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/screens/products/AllProducts.dart';
import 'package:bonsai_shop/screens/products/filter.dart';
import 'package:bonsai_shop/screens/products/typeProduct.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../products/productDetail.dart';
import 'SliderHome.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  final Post data;
  const Home({
    Key? key,
    required this.data,
  }) : super(key: key);

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.lightGreen[900],
          automaticallyImplyLeading: false,
          title: Container(
            height:32,
            width: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/images/bonsai.png'),
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 10),
                  child: const Text(
                    'Bonsai',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            // IconButton(
            //     onPressed: () {
            //       auth.signOut().then((value) {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (_) => const Login()));
            //       }).onError((error, stackTrace) {
            //         Utils().toastMessage(error.toString());
            //       });
            //     },
            //     icon: const Icon(Icons.output)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, bottom: 70),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Search
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(3.0, 3.0),
                            blurRadius: 10.0,
                            spreadRadius: 5.0,

                          )
                        ]
                    ),
                    child: TextFormField(
                      // controller: searchFilter,

                      decoration: InputDecoration(

                        focusColor: Colors.lightGreen,
                        hintText: 'T??m ki???m',
                        hintStyle: TextStyle(color: Colors.lightGreen[900]),
                        prefixIcon: Icon(Icons.search_outlined, color: Colors.lightGreen[900],),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: Colors.lightGreen, width: 2),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,


                      ),
                      onChanged: (String value) {
                        setState(() {});
                      },
                    ),
                  ),
                ),

                // banner
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'BANNER',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500,
                          color: Colors.green[900]
                        ),

                      ),
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    Container(
                      height: 200,
                      child: const SliderHome(),
                    ),
                  ],
                ),

                const SizedBox(height: 15,),
                //
                // // l???c
                // Container(
                //   height: 200,
                //   child: Expanded(
                //     child: Filter(),
                //   ),
                // ),

                // san pham ban chay
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // padding: EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.only(top: 10, bottom: 25,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'S???N PH???M B??N CH???Y',
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          SizedBox(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const AllProducts()));
                                  },
                                  child: Row(
                                    children: const [
                                      Text('Xem t???t c??? '),
                                      Icon(Icons.navigate_next)
                                    ],
                                  )))
                        ],
                      ),
                      Container(
                          height: 300,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Expanded(
                              child: StreamBuilder(
                                  stream: ref.onValue,
                                  builder: (context,
                                      AsyncSnapshot<DatabaseEvent> snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      Map<dynamic, dynamic> map = snapshot
                                          .data!
                                          .snapshot
                                          .value as Map<dynamic, dynamic>;
                                      List<dynamic> list = [];
                                      list.clear();
                                      list = map.values.toList();

                                      // final name = snapshot.data!.snapshot.value.toString();

                                      return ListView.builder(
                                          physics: const ScrollPhysics(),
                                          itemCount: 6,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return InkWell(

                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) => const ProductDetail()));
                                                      },
                                                      child: Container(
                                                        margin:
                                                        const EdgeInsets.all(
                                                            5),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                          child:
                                                          SizedBox.fromSize(
                                                              size: const Size
                                                                  .square(
                                                                  170),
                                                              child: Image
                                                                  .network(
                                                                list[index]
                                                                ['url'],
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: double
                                                                    .infinity,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      child: Text(
                                                        list[index]['name'],
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              bottom: 7),
                                                      child: Text(
                                                        list[index]['address'],
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              '${list[index]['price']} ??',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .lightGreen,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets.only(
                                                                    left: 50),
                                                            child: const Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Colors.red,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  }))),
                    ],
                  ),
                ),

              //  mua gi ban nay
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'MUA G?? B??N N???Y',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500,
                          color: Colors.green[900]
                        ),

                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: const TypeProducts(),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ));
  }
}
