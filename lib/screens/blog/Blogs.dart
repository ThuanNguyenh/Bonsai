import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/screens/blog/add_blogs.dart';
import 'package:bonsai_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  final bool loading = false;

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');

  //search
  final searchFilter = TextEditingController();

  // edit
  final _formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final ePriceController = TextEditingController();
  final eAddressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm mới'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: AuthButton(
                title: 'Thêm sản phẩm',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AddBlogs()));
                },
                loading: loading),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                  hintText: 'Tìm kiếm',
                  hintStyle: TextStyle(fontSize: 16),
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.lightGreen,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  itemBuilder: (context, snapshot, animation, index) {
                    final name = snapshot.child('name').value.toString();
                    final address = snapshot.child('address').value.toString();
                    final price = snapshot.child('price').value.toString();

                    if (searchFilter.text.isEmpty) {
                      return Column(
                        children: [
                          Container(
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        3, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              visualDensity: const VisualDensity(
                                  vertical: 4, horizontal: 2),
                              leading: SizedBox(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: SizedBox.fromSize(
                                      size: const Size.square(110),
                                      child: Image.network(
                                        snapshot.child('url').value.toString(),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        // height: 200,
                                      )),
                                ),
                              ),
                              title: Container(
                                margin: const EdgeInsets.only(top: 10, bottom: 5),
                                child: Text(
                                  snapshot.child('name').value.toString(),
                                  style: const TextStyle(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.child('address').value.toString()} ',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    '${snapshot.child('price').value.toString()} đ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              isThreeLine: true,
                              trailing: PopupMenuButton(
                                icon: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 4,
                                      child: ListTile(
                                        onTap: () async{
                                          Navigator.pop(context);


                                            showMyDialog(name, address, price,snapshot.child('id').value.toString());


                                          // showMyDialog(name,snapshot.child('id').value.toString());



                                        },
                                        leading: const Icon(Icons.edit),
                                        title: const Text('Sửa'),
                                      )),
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          ref
                                              .child(snapshot
                                                  .child('id')
                                                  .value
                                                  .toString())
                                              .remove();
                                        },
                                        leading:
                                            const Icon(Icons.delete_outline),
                                        title: const Text('Xóa'),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    } else if (name.toLowerCase().contains(
                        searchFilter.text.toLowerCase().toLowerCase())) {
                      return Column(
                        children: [
                          Container(
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        3, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              visualDensity: const VisualDensity(
                                  vertical: 4, horizontal: 2),
                              leading: SizedBox(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: SizedBox.fromSize(
                                      size: const Size.square(110),
                                      child: Image.network(
                                        snapshot.child('url').value.toString(),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        // height: 200,
                                      )),
                                ),
                              ),
                              title: Container(
                                margin: const EdgeInsets.only(top: 10, bottom: 5),
                                child: Text(
                                  snapshot.child('name').value.toString(),
                                  style: const TextStyle(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.child('address').value.toString()} ',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    '${snapshot.child('price').value.toString()} đ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              isThreeLine: true,
                              trailing: PopupMenuButton(
                                icon: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          showMyDialog(name, address, price,snapshot.child('id').value.toString());

                                        },
                                        leading: const Icon(Icons.edit),
                                        title: const Text('Sửa'),
                                      )),
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          ref
                                              .child(snapshot
                                                  .child('id')
                                                  .value
                                                  .toString())
                                              .remove();
                                        },
                                        leading:
                                            const Icon(Icons.delete_outline),
                                        title: const Text('Xóa'),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(),
                  ))),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Future<void> showMyDialog(
    String name,
    String address,
    String price,
    String id,
  ) async {
    editController.text = name;
    ePriceController.text = price;
    eAddressController.text = address;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Chỉnh sửa'),
            content: SizedBox(
                height: 200,

                child: Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          controller: editController,
                          decoration: const InputDecoration(hintText: 'Tên sản phẩm'),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          controller: ePriceController,
                          decoration: const InputDecoration(hintText: 'Giá tiền'),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Hãy nhập nội dung !';
                            }
                            return null;
                          },
                          controller: eAddressController,
                          decoration: const InputDecoration(hintText: 'Địa chỉ'),
                        ),
                      ],
                    ))
          ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Hủy')),
              TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context);
                      ref.child(id).update({
                        'name': editController.text.toLowerCase(),
                        'address' : eAddressController.text.toLowerCase(),
                        'price' : ePriceController.text.toLowerCase()
                      }).then((value) {
                        Utils().toastMessage('Sửa thành công!');
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                    }

                  },
                  child: const Text('Cập nhật'))
            ],
          );
        });
  }
}
