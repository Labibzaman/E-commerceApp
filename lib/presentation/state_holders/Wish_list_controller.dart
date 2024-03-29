import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/service/Network_Caller.dart';
import '../../data/utility/URls.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  WishListModel _wishListModel = WishListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
      Urls.wishList,
    );
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
