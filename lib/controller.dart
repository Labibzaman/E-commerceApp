import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_OTP_controller.dart';
import 'package:get/get.dart';


class ControlBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(Main_bottom_controller());
    Get.put(SendOTPEmail_Controller());
  }
}
