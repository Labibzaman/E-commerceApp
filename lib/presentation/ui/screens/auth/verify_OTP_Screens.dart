import 'dart:async';
import 'dart:ffi';

import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/app_logo.dart';

class verifyOTPscreen extends StatefulWidget {
  const verifyOTPscreen({super.key});

  @override
  State<verifyOTPscreen> createState() => _verifyOTPscreenState();
}

class _verifyOTPscreenState extends State<verifyOTPscreen> {
  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;

  String code = '';
  late Timer _timer;
  int _start = 120;

  void resend() {
    setState(() {
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
    });
    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
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
                'A 4 digit OTP code has been sent',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              PinCodeTextField(
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
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                onCompleted: (v) {
                  setState(() {
                    code = v;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: code.length < 4
                      ? null
                      : () {
                          Verify();
                         Future.delayed(const Duration(seconds:2 ),(){
                            Get.to(const Complete_profileScreen());
                          });

                        },
                  child: isLoading
                      ? Container(
                          width: 20,
                          height: 20,
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        )
                      : isVerified
                          ? const Icon(Icons.check_circle_outline)
                          : const Text('Next',style: TextStyle(color: Colors.white),),
                ),
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
              TextButton(
                onPressed: () {
                  if (isResend) return;
                  resend();
                },
                child: const Text(
                  'Resend',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
