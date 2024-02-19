import 'package:crafty_bay/data/models/CategoryList_item.dart';
import 'package:crafty_bay/data/models/categoryList_Model.dart';
import 'package:crafty_bay/data/models/new_brand_list_model.dart';
import 'package:crafty_bay/presentation/ui/screens/productList_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../utility/appcolors.dart';

class BrandItemList extends StatelessWidget {
  const BrandItemList({
    super.key,
    required this.category,
  });

  final BrandListModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductList_Screen(
          Category: category.BrandListData?.first.brandName ?? '',
          CategoryID: category.BrandListData?.first.id,
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.2),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                  category.BrandListData?.first.brandImg ?? '',
                  width: 40,
                  height: 40,
                )),
          ),
          Text(
            category.BrandListData?.first.brandName ?? '',
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
