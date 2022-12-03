
import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:bonsai_shop/screens/add_blogs.dart';
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
  final searchFilter = TextEditingController();
  final editController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài viết'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: AuthButton(
                title: 'Thêm bài viết',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AddBlogs()));
                },
                loading: loading),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
              onChanged: (String value){
                setState(() {

                });
              },
            ),
          ),

    //       Expanded(child: StreamBuilder(
    //         stream: ref.onValue,
    //         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
    //
    //           if(!snapshot.hasData){
    //             return const Center(child: CircularProgressIndicator(),);
    //           } else {
    //             Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
    //             List<dynamic> list = [] ;
    //             list.clear();
    //             list = map.values.toList();
    //             return ListView.builder(
    //               itemCount: snapshot.data!.snapshot.children.length,
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                   subtitle: Text(list[index]['id']),
    //                   title: Text( list[index]['title']),
    //                 );
    //               },
    //             );
    //           }
    //
    // },
    //       )),

          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {

                    final title = snapshot.child('title').value.toString();

                    if(searchFilter.text.isEmpty){
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showMyDialog(title, snapshot.child('id').value.toString());
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text('Sửa'),
                                )),
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    ref.child(snapshot.child('id').value.toString()).remove();
                                  },
                                  leading: Icon(Icons.delete_outline),
                                  title: Text('Xóa'),
                                ))
                          ],
                        ),
                      );
                    } else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showMyDialog(title, snapshot.child('id').value.toString());
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text('Sửa'),
                                )),
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    ref.child(snapshot.child('id').value.toString()).remove();
                                  },
                                  leading: Icon(Icons.delete_outline),
                                  title: Text('Xóa'),
                                ))
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }


                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(),
                  )))
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title, String id)async{
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chỉnh sửa'),
          content: Container(
            child: TextField(
              controller: editController,
              decoration: InputDecoration(
                hintText: 'Chỉnh sửa'
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Hủy')),

            TextButton(onPressed: (){
              Navigator.pop(context);
              ref.child(id).update({
                'title': editController.text.toLowerCase()
              }).then((value) {
                Utils().toastMessage('Sửa thành công!');
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            }, child: Text('Cập nhật'))
          ],
        );
      }
    );
  }
}
