import 'package:bonsai_shop/screens/products/productDetail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchFilter = TextEditingController();

  final bool loading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Tất cả sản phẩm'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        centerTitle: true,
        foregroundColor: Colors.lightGreen,
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      body: Column(
        // physics: const AlwaysScrollableScrollPhysics(),
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(3.0, 3.0),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,

                  )
                ]
              ),
              child: TextFormField(
                controller: searchFilter,
                decoration: InputDecoration(
                    focusColor: Colors.lightGreen,
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(color: Colors.lightGreen[900]),
                    prefixIcon: Icon(Icons.search_outlined, color: Colors.lightGreen[900],),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.lightGreen, width: 2),
                    ),

                    border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true
                ),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),
          ),



          Expanded(
              child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as Map<dynamic , dynamic>;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();

                    final name = snapshot.data!.snapshot.value.toString();

                    if (searchFilter.text.isEmpty) {
                      return GridView.builder(
                          physics: const ScrollPhysics(),

                          itemCount: snapshot.data!.snapshot.children.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 290,
                              mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ProductDetail()));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          child: SizedBox.fromSize(
                                              size: const Size.square(170),
                                              child: Image.network(
                                                list[index]['url'],
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        list[index]['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
                                      child: Text(
                                        list[index]['address'],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              '${list[index]['price']} đ',
                                              style: const TextStyle(
                                                color: Colors.lightGreen,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          const Icon(Icons.favorite_border, color: Colors.red,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else if (name.toLowerCase().contains(
                        searchFilter.text.toLowerCase().toLowerCase())) {
                      return GridView.builder(
                          physics: const  ScrollPhysics(),
                          itemCount: snapshot.data!.snapshot.children.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 290,
                              mainAxisSpacing: 20
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (_) => ProductDetail()));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          child: SizedBox.fromSize(
                                              size: const Size.square(170),
                                              child: Image.network(
                                                list[index]['url'],
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Text(
                                        list[index]['name'],
                                        style:const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      padding:const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        list[index]['address'],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              '${list[index]['price']} đ',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                color: Colors.lightGreen
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.favorite_border, color: Colors.red,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Container();
                    }
                  }
                },
              ),
          ),
          const SizedBox(height: 10,)


        ],
      ),
    );
  }
}
