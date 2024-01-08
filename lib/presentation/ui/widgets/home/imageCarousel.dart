import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/appcolors.dart';

class Home_imageCarousel extends StatefulWidget {
  const Home_imageCarousel({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<Home_imageCarousel> createState() => _Home_imageCarouselState();
}

class _Home_imageCarouselState extends State<Home_imageCarousel> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 200.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
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
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    )
                ],
              );
            })
      ],
    );
  }
}
