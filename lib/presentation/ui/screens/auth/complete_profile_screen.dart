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
  final TextEditingController CustomerAddController = TextEditingController();
  final TextEditingController mobileNAmeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController shippingController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController Countrycodecontroller = TextEditingController();
  final TextEditingController stateController = TextEditingController();
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
                      return 'Enter your name';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Your name'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: CustomerAddController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Customer Address';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Your Address'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: mobileNAmeController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your Mobile';
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
                      return 'Customer ';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'city'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Countrycodecontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Postal code ';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: ' Country'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: postalCodeController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Postal code ';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Postal code'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: stateController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter State';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'State'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: shippingController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Shipping Address';
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
                  child: GetBuilder<Complete_Profile_Controller>(
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
                              cusName:firsNAmeController.text.trim(),
                              cusAdd: CustomerAddController.text.trim(),
                              cusCity: cityController.text.trim(),
                              cusState: stateController.text.trim(),
                              cusPostcode: postalCodeController.text.trim(),
                              cusCountry: Countrycodecontroller.text.trim(),
                              cusPhone: mobileNAmeController.text.trim(),
                              cusFax: mobileNAmeController.text.trim(),
                              shipName: firsNAmeController.text.trim(),
                              shipAdd: CustomerAddController.text.trim(),
                              shipCity: cityController.text.trim(),
                              shipState: stateController.text.trim(),
                              shipPostcode:
                              postalCodeController.text.trim(),
                              shipCountry: Countrycodecontroller.text.trim(),
                              shipPhone: mobileNAmeController.text.trim(),
                            );
                            final bool result =
                                await controller.createProfileData(
                                    Get.find<Verify_otp_controller>().token,
                                    createdParams);
                            if (result) {
                              Get.offAll(() => const MainBottoma_navScreen());
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
    CustomerAddController.dispose();
    cityController.dispose();
    mobileNAmeController.dispose();
    shippingController.dispose();
    Countrycodecontroller.dispose();
    super.dispose();
  }
}
