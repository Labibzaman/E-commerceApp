import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

class AddToWishController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> addToWish(int productID) async {
    bool _isSuccess = false;
    _inProgress = true;
    update();

    final response =
    await NetworkCaller().getRequest(Urls.createWishList(productID));
    if (response.isSuccess) {
      _isSuccess = true;
     Get.showSnackbar(const GetSnackBar(
       title: 'Successful',
       message: 'Product added to wish List',
       duration: Duration(seconds: 2),
     ));
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}
