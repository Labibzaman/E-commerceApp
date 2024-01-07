import 'package:crafty_bay/presentation/ui/screens/auth/verify_OTP_Screens.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_logo.dart';

class Complete_profileScreen extends StatefulWidget {
  const Complete_profileScreen({super.key});

  @override
  State<Complete_profileScreen> createState() => _Complete_profileScreenState();
}

class _Complete_profileScreenState extends State<Complete_profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Hero(
                tag: 'appLogo',
                child: AppLogo(height: 80),
              ),
              const SizedBox(height: 16),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Get Started With us with your details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Mobile Number'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'city'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 4,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Shipping Address'),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const MainBottom_Nav_Screen());
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
