import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/appcolors.dart';

class ProductDetail_Carousel extends StatefulWidget {
  const ProductDetail_Carousel({
    super.key,
    this.height,
    required this.urls,
  });

  final double? height;
  final List<String> urls;

  @override
  State<ProductDetail_Carousel> createState() => _ProductDetail_CarouselState();
}

class _ProductDetail_CarouselState extends State<ProductDetail_Carousel> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(url))),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;i< widget.urls.length; i++)
                      Container(
                        height: 14,
                        width: 14,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                  ],
                );
              }),
        )
      ],
    );
  }
}
