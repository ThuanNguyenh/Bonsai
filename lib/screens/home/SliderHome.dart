import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({Key? key}) : super(key: key);

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  final ref = FirebaseDatabase.instance.ref('Image');
  final searchFilter = TextEditingController();

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

                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox.fromSize(
                          size: const Size.square(320),
                          child: Image.network(
                            list[index]['image'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          )),
                    ),
                  );
                });
          }


        }
    );
  }
}