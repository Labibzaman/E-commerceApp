import 'package:crafty_bay/data/models/Banner_list_model.dart';
import 'package:crafty_bay/data/models/categoryList_Model.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

import '../../data/models/new_brand_list_model.dart';

class BrandList_controller extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  BrandListModel _brandListModel = BrandListModel();

  BrandListModel get brandListModel => _brandListModel;

  bool _isSuccess = false;

  bool get isProfileCompleted => _isSuccess;

  Future<bool> getCategoryList() async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.getBrandList);

    _inProgress = false;

    if (response.isSuccess) {
      final bannerData = response.responseData;
      _brandListModel = BrandListModel.fromJson(bannerData);

      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return _isSuccess;
  }
}
