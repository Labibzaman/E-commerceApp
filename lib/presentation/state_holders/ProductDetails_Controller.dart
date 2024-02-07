import 'package:crafty_bay/data/models/ResponseDATA.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:get/get.dart';

import '../../data/models/product_details_data.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = '';

  ProductDetails_Model _productDetails_Model = ProductDetails_Model();

  ProductDetailsData get productDetails =>
      _productDetails_Model.ProductDetailsdataList!.first;

  Future<bool> getProductDetails(int productID) async {
    _inProgress = true;
    bool isSuccess = false;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.ProductListDetails(productID));
    if (response.isSuccess) {
      _productDetails_Model =
          ProductDetails_Model.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
