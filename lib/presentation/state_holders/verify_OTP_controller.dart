import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:get/get.dart';

class Verify_OTP_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool _goTOCompleteProfile = true;

  bool get shouldNavigateToCompleteProfile => _goTOCompleteProfile;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  String _token = '';

  String get token => _token;



  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.VerifyOTPemail(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));
      final result =
      await Get.find<Read_Profile_controller>().readProfileData(token);
      if (result) {
        _goTOCompleteProfile = Get.find<Read_Profile_controller>().isProfileCompleted == false;
        if (_goTOCompleteProfile == false) {
          await Get.find<Auth_Controller>().saveUserInformation(token, Get.find<Read_Profile_controller>().profile);
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