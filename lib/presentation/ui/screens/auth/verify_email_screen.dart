import 'package:crafty_bay/presentation/state_holders/send_OTP_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_OTP_Screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_logo.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController emailTEcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                  controller: emailTEcontroller,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter email Address';
                    }
                    if (!emailRegex.hasMatch(value!)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Email Address'),
                ),
                const SizedBox(height: 10),
                GetBuilder<SendOTPEmail_Controller>(builder:
                    (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      visible: controller.inProgress == false,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result = await controller
                                .sendOTP(emailTEcontroller.text.trim());
                            if (result) {
                              Get.to( verifyOTPscreen(email: emailTEcontroller.text.trim()));
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
}
