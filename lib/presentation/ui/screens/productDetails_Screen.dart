import 'package:crafty_bay/presentation/state_holders/ProductDetails_Controller.dart';
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

  Color _selectedColor = Colors.red;

  List<String> Sizes = [
    'm',
    'L',
    'XL',
    'XXL',
    'XXl',
  ];

  String _selectedSize = 'm';

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
                          productDetailsController.productDetails.img1 ??'',
                          productDetailsController.productDetails.img2 ??'',
                          productDetailsController.productDetails.img3??'',
                          productDetailsController.productDetails.img4 ??'',
                        ],
                      ),
                      ProductDetails_Body
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

  Padding get ProductDetails_Body {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'New Year special Shoe Nike air Jorder - Save 30%',
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
          Row(
            children: [
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
          ),
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
            Productcolors: Productcolors,
            onChanged: (c) {
              _selectedColor = c;
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
            Sizes: Sizes,
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
          const Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        ''',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
          ),
        ],
      ),
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
