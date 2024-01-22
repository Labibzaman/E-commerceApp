import 'package:crafty_bay/data/models/ResponseDATA.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:get/get.dart';

class Verify_OTP_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool _shouldNavigateToCompleteProfile = true;

  bool get shouldNavigateToCompleteProfile => _shouldNavigateToCompleteProfile;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> VerifyOTP(String email, String OTP) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.VerifyOTPemail(email, OTP));

    _inProgress = false;

    if (response.isSuccess) {
      final token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));

      final result =
          await Get.find<Read_Profile_controller>().ReadProfileDATA(token);

      if (result) {
        _shouldNavigateToCompleteProfile =
            Get.find<Read_Profile_controller>().isProfileCompleted;
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
