import 'package:crafty_bay/data/models/ResponseDATA.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

class SendOTPEmail_Controller extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> sendOTP(String url) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendOTPemail(url));
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
