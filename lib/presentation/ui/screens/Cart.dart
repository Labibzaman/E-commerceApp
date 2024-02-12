import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/add_to_Cart_controller.dart';
import '../../state_holders/cart_list_controller.dart';
import '../widgets/cart/cart_ProductList_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.inProgress==true){
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartListController.cartListModel.cartItemList?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      return const CartProduct_Item();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                  ),
                ),
                checkOutAndPrice,
              ],
            );
          }
        ),
      ),
    );
  }

  Container get checkOutAndPrice {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                '\$12563755',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {},
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
