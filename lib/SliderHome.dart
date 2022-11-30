import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/network/data.dart';
import 'package:bonsai_shop/screens/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatefulWidget {
  final Post? data;
  const SliderHome({Key? key, required this.data}) : super(key: key);

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          CarouselSlider.builder(
            itemCount: data.length,
            itemBuilder: (context, index, realIndex) {
              // ignore: unused_local_variable
              final carruselImage = data[index];
              return CardImages(data: data[index],);
            },
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final Post data;
  const CardImages({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            data.copy();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cart(
                      data: data,
                    )));
          },
          child: FadeInImage(
            placeholder: const AssetImage("lib/images/start1.jpg"),
            image: AssetImage(data.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
