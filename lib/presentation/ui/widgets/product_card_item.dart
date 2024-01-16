import 'package:crafty_bay/presentation/ui/screens/productDetails_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/appcolors.dart';
import '../utility/assets_path.dart';

class ProductCard_item extends StatelessWidget {
  const ProductCard_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: InkWell(
        onTap: () {
          Get.to(() => const ProductDetailsScreen());
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
                child: Image.asset(
                  AssetsPath.shoePng,
                  width: 150,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Nike Air Jordan',
                    maxLines: 1,
                    style: TextStyle(
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
                      const Text(
                        '\$120',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const Text(
                            '4.5',
                            style: TextStyle(color: Colors.black45),
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
