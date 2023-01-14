import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SliderMenuState createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  int _currentIndex = 0;
  List<String> images = [
    "https://res.cloudinary.com/rainforest-cruises/images/c_fill,g_auto/f_auto,q_auto/v1622207103/Indonesian-Food-Main/Indonesian-Food-Main.jpg",
    "https://cdn-image.hipwee.com/wp-content/uploads/2018/05/hipwee-8301162_20170531121322.png",
    "https://www.mauryregional.com/media/BlogImages/LQ%20Mint%20Iced%20Tea.jpg",
    "https://ik.imagekit.io/10tn5i0v1n/article/21b7630cb3e676164b208ff6c4bc41f1.jpeg"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 230,
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
            items: images.map((item) {
              return ItemCard(images: item.toString());
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(images, (index, url) {
            return Container(
              width: _currentIndex == index ? 30 : 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.blue.withOpacity(0.3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String images;

  const ItemCard({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Image.network(images),
    );
  }
}
