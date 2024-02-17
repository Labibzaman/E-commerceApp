import 'package:get/get.dart';

import '../../data/models/read_profile_model.dart';

import '../../data/service/Network_Caller.dart';
import '../../data/utility/urls.dart';

class Read_Profile_controller extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ReadProfileModel _readProfile = ReadProfileModel();

  ReadProfileModel get readProfile => _readProfile;

  bool _isProfileCompleted = false;

  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> readProfileData(String token) async {
    _inProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.ReadProfileURL, token: token);
    _inProgress = false;
    if (response.isSuccess) {
      final profileData = response.responseData['data'];
      if (profileData == null) {
        _isProfileCompleted = false;
      } else {
        _readProfile = ReadProfileModel.fromJson(profileData);
        _isProfileCompleted = true;
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
