import 'package:crafty_bay/data/models/CategoryList_item.dart';
import 'package:crafty_bay/data/models/categoryList_Model.dart';
import 'package:crafty_bay/presentation/ui/screens/productList_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../data/models/brand_model.dart';
import '../utility/appcolors.dart';

class BrandItemList extends StatelessWidget {
  const BrandItemList({
    super.key,
    required this.BrandData,
  });

  final Brand BrandData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductList_Screen(
          Category: BrandData.brandName ?? '',
          CategoryID: BrandData.id,
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
                  BrandData.brandImg ?? '',
                  width: 40,
                  height: 40,
                )),
          ),
          Text(
            BrandData.brandName ?? '',
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
