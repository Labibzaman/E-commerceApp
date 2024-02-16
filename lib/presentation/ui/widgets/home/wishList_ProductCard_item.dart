import 'package:crafty_bay/data/models/productItem_model.dart';
import 'package:crafty_bay/presentation/state_holders/Wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/removeWish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/productDetails_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/appcolors.dart';


class WishListProductCard_item extends StatefulWidget {
  const WishListProductCard_item({
    super.key, required this.product, required this.onTap,
  });
  final ProductList_item product;
  final VoidCallback onTap;

  @override
  State<WishListProductCard_item> createState() => _WishListProductCard_itemState();
}

class _WishListProductCard_itemState extends State<WishListProductCard_item> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: InkWell(
        onTap: () {
          Get.to(() =>  ProductDetailsScreen(productId: widget.product.id!,));
        },
        borderRadius: BorderRadius.circular(16),
        child: Card(
          child: GetBuilder<RemoveWishListController>(
            builder: (removeWishController) {

              return Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.network(
                      widget.product.image??'',
                      width: 120,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.product.title??'',
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${widget.product.price??''}',
                            style: const TextStyle(color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${widget.product.star??0}',
                                style: const TextStyle(color: Colors.black45),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  color: AppColors.primaryColor,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return removeAlertDialog;
                                            });
                                      },
                                      child: const Icon(
                                        Icons.close,

                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
  AlertDialog get removeAlertDialog {
    return AlertDialog(
      title: const Text('Remove from Wish List'),
      content: const Text('Do you want to remove this item?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () async {
              Get.find<RemoveWishListController>().removeWishList(widget.product.id!);
              Get.find<WishListController>()
                  .wishListModel
                  .data!
                  .clear();
              Get.find<WishListController>().getWishList();
              Get.back();
            },
            child: const Text('Yes')),
      ],
    );
  }
}

