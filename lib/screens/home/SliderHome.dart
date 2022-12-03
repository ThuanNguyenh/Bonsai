
import 'package:bonsai_shop/network/data.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
       height: 200,
       width: double.infinity,
       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(20))
       ),
       child: Container(
         margin: const EdgeInsets.only(
             left: 5, right: 5),
         child: ClipRRect(
           borderRadius:
           const BorderRadius.all(
             Radius.circular(20),
           ), // Image border
           child: SizedBox.fromSize(
             size: const Size.square(
                 230), // Image radius
             child: Image.asset(
               'lib/images/start2.png',
               width: double.infinity,
               fit: BoxFit.cover,
             ),
           ),
         ),
       ),
     );
  }
}

