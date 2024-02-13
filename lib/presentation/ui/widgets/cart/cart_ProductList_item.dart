
import 'package:crafty_bay/data/models/cart_item_model.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../../state_holders/cart_list_controller.dart';
import '../../utility/assets_path.dart';

class CartProduct_Item extends StatefulWidget {
  const CartProduct_Item({
    super.key, required this.cartItem,
  });

final CartItem cartItem;
  @override
  State<CartProduct_Item> createState() => _CartProduct_ItemState();
}

class _CartProduct_ItemState extends State<CartProduct_Item> {

  ValueNotifier<int> numberOfItems = ValueNotifier(1);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.network(
            widget.cartItem.product?.image??'',
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cartItem.product?.title??'',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'Color: ${widget.cartItem.color??''}',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Size: ${widget.cartItem.size??''}',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      '\$${widget.cartItem.product?.price??0}',
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: numberOfItems,
                        builder: (context, value, _) {
                          return ItemCount(
                            initialValue: value,
                            minValue: 1,
                            maxValue: 10,
                            decimalPlaces: 0,
                            color: AppColors.primaryColor,
                            onChanged: (v) {
                              numberOfItems.value = v.toInt();
                              Get.find<CartListController>().UpdateQuantity(widget.cartItem.id!, numberOfItems.value);
                            },
                          );
                        }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
