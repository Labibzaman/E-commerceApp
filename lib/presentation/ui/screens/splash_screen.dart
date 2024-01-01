import 'package:crafty_bay/presentation/ui/screens/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(const VerifyEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AssetsPath.logo,
              width: 120,
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            const Text('Version 1.0'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
