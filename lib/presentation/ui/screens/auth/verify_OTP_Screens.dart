import 'dart:async';
import 'dart:ffi';

import 'package:crafty_bay/presentation/state_holders/send_OTP_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_OTP_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/app_logo.dart';

class verifyOTPscreen extends StatefulWidget {
  const verifyOTPscreen({super.key, required this.email});

  final String email;

  @override
  State<verifyOTPscreen> createState() => _verifyOTPscreenState();
}

class _verifyOTPscreenState extends State<verifyOTPscreen> {
  final TextEditingController _Verifyotpcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final resendOTPsender = Get.find<SendOTPEmail_Controller>();

  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;
  bool isSucces = false;

  String code = '';
  late Timer _timer;
  int _start = 120;

  void resend() {
    setState(() {
      resendOTPsender.sendOTP(widget.email);
      isResend = true;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 120;
          isResend = false;
          _timer.cancel();
        } else {
          _start--;
        }
        ;
      });
    });
  }

  void Verify() {
    setState(() {
      isLoading = true;

      isSucces = true;
    });
    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        isSucces = false;
        isLoading = false;
        isVerified = true;
      });
    });
  }

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
                const SizedBox(height: 160),
                Hero(tag: 'appLogo', child: AppLogo(height: 80)),
                const SizedBox(height: 16),
                Text(
                  'Enter OTP code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 digit OTP code has been sent to this',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  widget.email ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                PinCodeTextField(
                  controller: _Verifyotpcontroller,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter OTP';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: AppColors.primaryColor,
                      activeColor: AppColors.primaryColor,
                      selectedColor: Colors.purpleAccent,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    setState(() {
                      code = v;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child:
                      GetBuilder<Verify_OTP_controller>(builder: (controller) {
                    return Visibility(
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      visible: controller.inProgress == false,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final bool response = await controller.VerifyOTP(
                                widget.email, _Verifyotpcontroller.text);
                            if (response) {
                              if (controller.shouldNavigateToCompleteProfile) {
                                Get.to(() => const Complete_profileScreen());
                              } else {
                                Get.offAll(() => const MainBottom_Nav_Screen());
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'OTP verification failed',
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
                    );
                  }),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        const TextSpan(text: 'This code will expire  '),
                        TextSpan(
                          text: '${_start.toString()}s',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ]),
                ),
                GetBuilder<SendOTPEmail_Controller>(builder: (controller) {
                  return TextButton(
                    onPressed: () {
                      if (isResend) return;
                      resend();
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(color: Colors.grey),
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
}
