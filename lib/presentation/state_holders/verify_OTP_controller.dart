
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/service/Network_Caller.dart';
import '../../data/utility/URls.dart';

class Verify_otp_controller extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';

  String get token => _token;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.VerifyOTPemail(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      final result =
      await Get.find<Read_Profile_controller>().readProfileData(_token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<Read_Profile_controller>().isProfileCompleted == false;
        if (_shouldNavigateCompleteProfile == false) {
          Get.find<Auth_Controller>().saveUserInformation(
              _token, Get.find<Read_Profile_controller>().readProfile,null);
        }
      } else {
        _errorMessage = Get.find<Read_Profile_controller>().errorMessage!;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
