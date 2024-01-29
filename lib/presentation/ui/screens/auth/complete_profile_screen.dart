import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/Complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_OTP_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
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
  final TextEditingController firsNAmeController = TextEditingController();
  final TextEditingController lastNAmeController = TextEditingController();
  final TextEditingController mobileNAmeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController shippingController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
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
                  controller: firsNAmeController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your first name';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First Name'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: lastNAmeController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your first name';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: mobileNAmeController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your first name';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Mobile Number'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your first name';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'city'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: shippingController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your first name';
                    } else {
                      return null;
                    }
                  },
                  maxLines: 4,
                  textInputAction: TextInputAction.next,
                  decoration:
                      const InputDecoration(hintText: 'Shipping Address'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<Complete_profile_controller>(
                      builder: (controller) {
                    return Visibility(
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      visible: controller.inProgress == false,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final createdParams = CreateProfile_params(
                              firstName: firsNAmeController.text.trim(),
                              lastName: lastNAmeController.text.trim(),
                              mobile: mobileNAmeController.text.trim(),
                              city: cityController.text.trim(),
                              Shipping: shippingController.text.trim(),
                            );
                            final bool result =
                                await controller.CreateProfileDATA(
                                    Get.find<Verify_OTP_controller>().token,
                                    createdParams);
                            if (result) {
                              Get.offAll(() => const MainBottom_Nav_Screen());
                            } else {
                              Get.showSnackbar(const GetSnackBar(
                                title: 'Failed',
                                message: 'Something went wrong',
                                duration: Duration(seconds: 2),
                              ));
                            }
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firsNAmeController.dispose();
    lastNAmeController.dispose();
    cityController.dispose();
    mobileNAmeController.dispose();
    shippingController.dispose();
    super.dispose();
  }
}
