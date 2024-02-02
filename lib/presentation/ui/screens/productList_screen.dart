import 'package:flutter/material.dart';

import '../widgets/product_card_item.dart';

class ProductList_Screen extends StatefulWidget {
  const ProductList_Screen({super.key, this.Category});

  final String? Category;

  @override
  State<ProductList_Screen> createState() => _ProductList_ScreenState();
}

class _ProductList_ScreenState extends State<ProductList_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.Category ?? 'Products',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
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
    );
  }
}
