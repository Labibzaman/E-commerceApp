import 'package:crafty_bay/presentation/state_holders/Common_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_item.dart';

class ProductList_Screen extends StatefulWidget {
  const ProductList_Screen({super.key, this.Category, this.CategoryID});

  final String? Category;
  final int? CategoryID;

  @override
  State<ProductList_Screen> createState() => _ProductList_ScreenState();
}

class _ProductList_ScreenState extends State<ProductList_Screen> {
  @override
  void initState() {
    super.initState();
    if (widget.CategoryID != null) {
      Get.find<CommonProduct_controller>()
          .getCommonList(CategoryId: widget.CategoryID!);
    }
  }

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
        child:
            GetBuilder<CommonProduct_controller>(builder: (commonController) {
          return Visibility(
            visible: commonController.inProgress == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Visibility(
              visible: commonController.CommonListModel.data?.isNotEmpty?? false,
              replacement: const Center(child: Text('No Products')),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.70,
                ),
                itemCount: commonController.CommonListModel.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return FittedBox(
                    child: ProductCard_item(
                      product: commonController.CommonListModel.data![index],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
