import 'package:bonsai_shop/buttons/auth_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final ref = FirebaseDatabase.instance.ref('Post');

  final bool loading = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {


          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else{
            Map<dynamic, dynamic> map =
            snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
            List<dynamic> list = [];
            list.clear();
            list = map.values.toList();

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(list[index]['title']),
                  );
                });
          }


        }
    );
  }
}