import 'package:crafty_bay/data/models/productItem_model.dart';
import 'package:crafty_bay/presentation/ui/screens/productDetails_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/appcolors.dart';


class WishListProductCard_item extends StatelessWidget {
  const WishListProductCard_item({
    super.key, required this.product,
  });
  final ProductList_item product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: InkWell(
        onTap: () {
          Get.to(() =>  ProductDetailsScreen(productId: product.id!,));
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
                  product.image??'',
                  width: 120,
                  height: 100,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Column(
                children: [
                  Text(
                    product.title??'',
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
                        '\$${product.price??''}',
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
                            '${product.star??0}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: AppColors.primaryColor,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                size: 20,
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