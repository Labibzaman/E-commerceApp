import 'package:crafty_bay/presentation/state_holders/Category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/categoryItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Category_Screen extends StatefulWidget {
  const Category_Screen({super.key});

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          elevation: 3,
          backgroundColor: Colors.white,
          title: const Text(
            'Category',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
           await Get.find<CategoryList_controller>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GetBuilder<CategoryList_controller>(
              builder: (categoryController) {
                return Visibility(
                  visible: categoryController.inProgress==false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.90,
                    ),
                    itemCount: categoryController.CategoryListModel.CategoryList?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      return  FittedBox(
                        child: CategoryItemList(
                          category: categoryController.CategoryListModel.CategoryList![index],
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
