
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

import '../../data/models/ProductList_model.dart';

class CommonProduct_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Popularist_Model _commonListModel = Popularist_Model();

  Popularist_Model get CommonListModel => _commonListModel;

  bool _isSuccess = false;

  bool get isProfileCompleted => _isSuccess;

  Future<bool> getCommonList({required int CategoryId}) async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.ListbyCategory(CategoryId));

    _inProgress = false;

    if (response.isSuccess) {
      final bannerData = response.responseData;
      _commonListModel = Popularist_Model.fromJson(bannerData);

      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return _isSuccess;
  }
}
