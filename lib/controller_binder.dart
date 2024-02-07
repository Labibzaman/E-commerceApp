import 'package:crafty_bay/presentation/state_holders/Category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/Common_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/Complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/New_Product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/Popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_OTP_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_OTP_controller.dart';
import 'package:get/get.dart';


class ControlBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(Main_bottom_controller());
    Get.put(SendOTPEmail_Controller());
    Get.put(Verify_OTP_controller());
    Get.put(Read_Profile_controller());
    Get.put(Auth_Controller());
    Get.put(Complete_profile_controller());
    Get.put(Product_list_Slider());
    Get.put(CategoryList_controller());
    Get.put(PopularProduct_controller());
    Get.put(SpecialProduct_controller());
    Get.put(NewProduct_controller());
    Get.put(CommonProduct_controller());
  }
}
