
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

import '../../data/models/ProductList_model.dart';

class SpecialProduct_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Popularist_Model _specialListModel = Popularist_Model();

  Popularist_Model get SpecialListModel => _specialListModel;

  bool _isSuccess = false;

  bool get isProfileCompleted => _isSuccess;

  Future<bool> getSpecialList() async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.SpecialList);

    _inProgress = false;

    if (response.isSuccess) {
      final bannerData = response.responseData;
      _specialListModel = Popularist_Model.fromJson(bannerData);

      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return _isSuccess;
  }
}
