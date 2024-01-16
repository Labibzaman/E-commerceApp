import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Cart.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishList.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottom_Nav_Screen extends StatefulWidget {
  const MainBottom_Nav_Screen({super.key});

  @override
  State<MainBottom_Nav_Screen> createState() => _MainBottom_Nav_ScreenState();
}

class _MainBottom_Nav_ScreenState extends State<MainBottom_Nav_Screen> {
  final List<Widget> _screens=[
    const HomeScreen(),
    const Category_Screen(),
    const CartScreen(),
    const WishList_screen(),
  ];


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
