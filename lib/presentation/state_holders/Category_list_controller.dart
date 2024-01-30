import 'package:crafty_bay/data/models/Banner_list_model.dart';
import 'package:crafty_bay/data/models/categoryList_Model.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

class Product_list_Slider extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  CategoryList_Model _CategoryListModel = CategoryList_Model();

  CategoryList_Model get CategoryListModel => _CategoryListModel;

  bool _isSuccess = false;

  bool get isProfileCompleted => _isSuccess;

  Future<bool> getSliderlist() async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.ProductListSlider);

    _inProgress = false;

    if (response.isSuccess) {
      final bannerData = response.responseData;
      _CategoryListModel = CategoryList_Model.fromJson(bannerData);

      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return _isSuccess;
  }
}
