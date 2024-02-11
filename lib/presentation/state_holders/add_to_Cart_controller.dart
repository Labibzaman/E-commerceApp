import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> addToCart(int productID, String color, String size) async {
    bool _isSuccess = false;
    _inProgress = true;

    Map<String, dynamic>inputParams = {
      "product_id": productID,
      "color": color,
      "size": size
    };

    final response = await NetworkCaller().postRequest(Urls.addToCart, body:inputParams);
    if(response.isSuccess){
      _isSuccess=true;
    }else{
      _errorMessage=response.errorMessage;
    }
    _inProgress=false;
    update();
    return _isSuccess;
  }
}
