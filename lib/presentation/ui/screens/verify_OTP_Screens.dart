import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';

class verifyOTPscreen extends StatefulWidget {
  const verifyOTPscreen({super.key});

  @override
  State<verifyOTPscreen> createState() => _verifyOTPscreenState();
}

class _verifyOTPscreenState extends State<verifyOTPscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 160),
            AppLogo(height: 80),
            const SizedBox(height: 16),
            Text(
              'Enter OTP code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'A 4 digit OTP code has been sent' ,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            PinCodeTextField(
              keyboardType:TextInputType.number,
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
                selectedFillColor: Colors.white
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
           
              onCompleted: (v) {
                print("Completed");
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              }, appContext: context,
            ),
            const SizedBox(height: 12),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text('Next',))),
          ],
        ),
      ),
    );
  }
}
