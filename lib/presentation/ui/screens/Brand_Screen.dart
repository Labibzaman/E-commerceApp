

import 'package:crafty_bay/presentation/state_holders/brandList_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/brandItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: GetBuilder<BrandList_controller>(builder: (controller) {
          return Visibility(
            visible: controller.inProgress == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: GridView.builder(
              itemCount: controller.brandListModel.BrandListData?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: BrandItemList(
                   BrandData: controller.brandListModel.BrandListData![index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Brand'),
    );
  }
}
