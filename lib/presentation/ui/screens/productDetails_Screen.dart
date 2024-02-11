import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/ProductDetails_Controller.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_Cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/appcolors.dart';
import '../widgets/product_Details/ColorSelector.dart';
import '../widgets/product_Details/ProductDetails_image_Carousel.dart';
import '../widgets/product_Details/SizeSelector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> numberOfItems = ValueNotifier(1);

  List<Color> Productcolors = [
    Colors.red,
    Colors.grey,
    Colors.black54,
    Colors.deepPurpleAccent,
    Colors.green,
  ];

  List<String> Sizes = [
    'm',
    'L',
    'XL',
    'XXL',
    'XXl',
  ];

  String? _selectedSize;
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        return Visibility(
          visible: productDetailsController.inProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductDetail_Carousel(
                        urls: [
                          productDetailsController.productDetails.img1 ?? '',
                          productDetailsController.productDetails.img2 ?? '',
                          productDetailsController.productDetails.img3 ?? '',
                          productDetailsController.productDetails.img4 ?? '',
                        ],
                      ),
                      ProductDetails_Body(
                          productDetailsController.productDetails)
                    ],
                  ),
                ),
              ),
              AddtoCart_price
            ],
          ),
        );
      }),
    );
  }

  Padding ProductDetails_Body(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ratingAndreview(productDetails.product?.star ?? 0),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'color',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          ColorSelector(
            Productcolors: productDetails.color
                    ?.split(',')
                    .map((e) => getColorFromStrin(e))
                    .toList() ??
                [],
            onChanged: (c) {
              _selectedColor = c.toString();
            },
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizeSelector(
            Sizes: productDetails.size?.split(',') ?? [],
            Onchanged: (c) {
              _selectedSize = c;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Text(
            productDetails.des ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Row ratingAndreview(double rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(color: Colors.black45),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Reviews',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            const SizedBox(
              width: 7,
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
    );
  }

  Container get AddtoCart_price {
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
                'Price',
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
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible:addToCartController.inProgress==false ,
                replacement: const Center(child: CircularProgressIndicator()),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedSize != null && _selectedColor != null) {
                      if (Get.find<Auth_Controller>().isTokenNotNull) {
                        _selectedColor =
                            colorCodetoHashColorCode(_selectedColor!);

                        final response = await addToCartController.addToCart(
                            widget.productId, _selectedColor!, _selectedSize!);
                        if (response) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Success',
                            message: 'Product has been add to cart',
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          Get.showSnackbar(GetSnackBar(
                            title: 'Failed',
                            message: addToCartController.errorMessage,
                            duration: const Duration(seconds: 2),
                          ));
                        }
                      } else {
                        Get.to(() => const VerifyEmailScreen());
                      }
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                        title: 'Add to Cart Failed',
                        message: 'please select color and size',
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color getColorFromStrin(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = 'FF$code';
    return Color(int.parse('0x$hexCode'));
  }

  String colorCodetoHashColorCode(String colorCode) {
    return colorCode
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }
}
