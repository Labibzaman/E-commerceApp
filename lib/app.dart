import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme:ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch)
      ),
      home:const Splash_Screen() ,
    );
  }
}
