import 'package:crafty_bay/data/models/ResponseDATA.dart';
import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:get/get.dart';

class Complete_profile_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> CreateProfileDATA(token,CreateProfile_params params) async {
    _inProgress = true;
    update();

    final response =
        await NetworkCaller().postRequest(Urls.CreateProfileURL, token: token,body: params.toJson());

    _inProgress = false;

    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      await Get.find<Auth_Controller>().saveUserInformation(token, _profile);

      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
