import 'package:crafty_bay/presentation/state_holders/Category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/New_Product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/Popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/brandList_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Cart_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_List_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/product_list_slider_controller.dart';

class MainBottoma_navScreen extends StatefulWidget {
  const MainBottoma_navScreen({super.key});

  @override
  State<MainBottoma_navScreen> createState() => _MainBottoma_navScreenState();
}

class _MainBottoma_navScreenState extends State<MainBottoma_navScreen> {
  final List<Widget> _screens=[
    const HomeScreen(),
    const Category_Screen(),
    const CartListScreen(),
    const WishList_screen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Get.find<Product_list_Slider>().getSliderlist();
    Get.find<CategoryList_controller>().getCategoryList();
    Get.find<BrandList_controller>().getCategoryList();
    Get.find<PopularProduct_controller>().getPopularList();
    Get.find<SpecialProduct_controller>().getSpecialList();
    Get.find<NewProduct_controller>().getNewList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Main_bottom_controller>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentIndex,
            onTap: (index){
              controller.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_outlined), label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Wish List'),
            ],
          ),
        );
      }
    );
  }
}
