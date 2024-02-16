import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/wish_list_model.dart';
import '../../data/service/Network_Caller.dart';
import '../../data/utility/URls.dart';

class RemoveWishListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  WishListModel _wishListModel = WishListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  WishListModel get wishListModel => _wishListModel;
  bool isSuccess = false;

  Future<bool> removeWishList(int productID) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
      Urls.removeWishList(productID),
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
