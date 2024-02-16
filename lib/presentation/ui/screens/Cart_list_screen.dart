import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/checkout_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/cart_list_controller.dart';
import '../widgets/cart/cart_ProductList_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  ValueNotifier<int> numberOfItems = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

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
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 2,
          title: const Text(
            'Cart',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.inProgress == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount:
                      cartListController.cartListModel.cartItemList?.length ??
                          0,
                  itemBuilder: (BuildContext context, int index) {
                    return CartProductItem(
                      cartItem:
                          cartListController.cartListModel.cartItemList![index],

                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
              ),
              checkOutAndPrice(cartListController.totalPrice),
            ],
          );
        }),
      ),
    );
  }

  Container checkOutAndPrice(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Obx(() => Text(
                    '৳$totalPrice',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  )),
            ],
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const CheckoutScreen());
              },
              child: const Text(
                'Check Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
