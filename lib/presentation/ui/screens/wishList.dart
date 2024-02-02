import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/main_nav_bottom_controller.dart';

class WishList_screen extends StatefulWidget {
  const WishList_screen({super.key});

  @override
  State<WishList_screen> createState() => _WishList_screenState();
}

class _WishList_screenState extends State<WishList_screen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<Main_bottom_controller>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<Main_bottom_controller>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          elevation: 3,
          backgroundColor: Colors.white,
          title: const Text(
            'Wish List',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 0.70,
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              // return const FittedBox(child: ProductCard_item());
            },
          ),
        ),
      ),
    );
  }
}
