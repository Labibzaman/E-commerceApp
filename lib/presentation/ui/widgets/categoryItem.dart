import 'package:crafty_bay/presentation/ui/screens/productList_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../utility/appcolors.dart';

class CategoryItemList extends StatelessWidget {
  const CategoryItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>const ProductList_Screen(Category:'Electronics'));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.2),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer_outlined,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const Text(
            'Electronics',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
