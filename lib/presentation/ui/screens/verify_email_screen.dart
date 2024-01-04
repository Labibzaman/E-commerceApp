import 'package:crafty_bay/presentation/ui/screens/verify_OTP_Screens.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/app_logo.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Hero(
              tag: 'appLogo',
              child: AppLogo(height: 80),
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Please Enter your email address',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email Address'),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const verifyOTPscreen());
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
