import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

class Product_list_Slider extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Profile _profile = Profile();

  Profile get profile => _profile;

  bool _isProfileCompleted = false;

  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> getSliderlist(String token) async {
    _inProgress = true;
    update();

    final response =
    await NetworkCaller().getRequest(Urls.ProductListSlider);

    _inProgress = false;

    if (response.isSuccess) {
      final profileData = response.responseData['data'];
      if (profileData.isEmpty) {
        _isProfileCompleted = false;
      } else {
        _profile = Profile.fromJson(profileData[0]);
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
