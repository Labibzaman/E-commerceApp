import 'package:crafty_bay/data/models/productItem_model.dart';
import 'package:crafty_bay/presentation/ui/screens/productDetails_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/add_to_wishList_controller.dart';
import '../utility/appcolors.dart';
import '../utility/assets_path.dart';

class ProductCard_item extends StatefulWidget {
  const ProductCard_item({
    super.key, required this.product,
  });
  final ProductList_item product;

  @override
  State<ProductCard_item> createState() => _ProductCard_itemState();
}

class _ProductCard_itemState extends State<ProductCard_item> {
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
          child: Column(
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
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: AppColors.primaryColor,
                            child:  Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(onTap: () async{
                                final response= await Get.find<AddToWishController>().addToWish(widget.product.id!);
                                if(response){
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Success',
                                    message: 'Added Successfully to Wish List',
                                    duration: Duration(seconds: 1),
                                    isDismissible: true,
                                  ));
                                }
                              },
                                child: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                  size: 20,
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
          ),
        ),
      ),
    );
  }
}
