import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../widgets/home/category_seeAll.dart';
import '../widgets/home/circle_Icon_Button.dart';
import '../widgets/home/imageCarousel.dart';

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
                const Home_imageCarousel(),
                const SizedBox(height: 8),
                homeCategoryandSeeText(
                  title: 'All Categories',
                  onTapSeeAll: () {},
                ),
                CategoryList_View,
                homeCategoryandSeeText(
                  title: 'Product',
                  onTapSeeAll: () {},
                ),
                ProductList_View
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
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const CategoryItemList();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 8);
        },
      ),
    );
  }

  SizedBox get ProductList_View {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image.asset(
                    AssetsPath.shoePng,
                    width: 110,
                  ),
                ),
                const Text('Nike Air Jordan')
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 8);
        },
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
          onTap: () {},
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
