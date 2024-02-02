import 'package:crafty_bay/presentation/state_holders/Category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/Popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/productList_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../data/models/banner_list_item.dart';
import '../../../data/models/banner_list_item.dart';
import '../../../data/models/banner_list_item.dart';
import '../widgets/categoryItem.dart';
import '../widgets/home/category_seeAll.dart';
import '../widgets/home/circle_Icon_Button.dart';
import '../widgets/home/imageCarousel.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                buildTextFormField,
                const SizedBox(height: 10),
                SizedBox(
                    height: 230,
                    child: GetBuilder<Product_list_Slider>(
                        builder: (bannerController) {
                      return Visibility(
                          visible: bannerController.inProgress == false,
                          replacement:
                              const Center(child: CircularProgressIndicator()),
                          child: Home_imageCarousel(
                              BannerList:
                                  bannerController.bannerListModel.BannerList ??
                                      []));
                    })),
                const SizedBox(height: 8),
                homeCategoryandSeeText(
                  title: 'All Categories',
                  onTapSeeAll: () {
                    Get.find<Main_bottom_controller>().changeIndex(1);
                  },
                ),
                CategoryList_View,
                homeCategoryandSeeText(
                  title: 'Popular',
                  onTapSeeAll: () {
                    Get.to(const ProductList_Screen());
                  },
                ),
                PopularProductView,
                homeCategoryandSeeText(
                  title: 'Special',
                  onTapSeeAll: () {},
                ),
                ProductListCardView,
                homeCategoryandSeeText(
                  title: 'New',
                  onTapSeeAll: () {},
                ),
                ProductListCardView
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox get CategoryList_View {
    return SizedBox(
      height: 120,
      child: GetBuilder<CategoryList_controller>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress==false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount:
                categoryController.CategoryListModel.CategoryList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItemList(
                category: categoryController.CategoryListModel.CategoryList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 8);
            },
          ),
        );
      }),
    );
  }

  SizedBox get ProductListCardView {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          // return const ProductCard_item();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 8);
        },
      ),
    );
  }

  SizedBox get PopularProductView {
    return SizedBox(
      height: 200,
      child: GetBuilder<PopularProduct_controller>(
        builder: (popularController) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: popularController.PopularListModel.data?.length??0,
            itemBuilder: (BuildContext context, int index) {
              return  ProductCard_item(product: popularController.PopularListModel.data![index],);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 8);
            },
          );
        }
      ),
    );
  }

  TextFormField get buildTextFormField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        CircleIconButton(
          onTap: () async {
            await Get.find<Auth_Controller>().clearDATA();
            Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active,
        ),
      ],
      title: Hero(
        tag: 'appLogo',
        child: Image.asset(AssetsPath.navLogo),
      ),
    );
  }
}
