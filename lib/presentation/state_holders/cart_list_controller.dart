
import 'package:get/get.dart';

import '../../data/models/cart_item_model.dart';
import '../../data/models/cart_listModel.dart';
import '../../data/service/Network_Caller.dart';
import '../../data/utility/URls.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CartListModel _cartListModel = CartListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  CartListModel get cartListModel => _cartListModel;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
      Urls.cartList,
    );
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _totalPrice.value = _calculateTotalPrice;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> removeCartList(int productID) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
     Urls.removeCartList(productID),
    );
    if (response.isSuccess) {

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.cartItemList?.firstWhere((element) => element.id == id)
        .quantity = quantity;
    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    for (CartItem item in _cartListModel.cartItemList ?? []) {
      total +=
          (double.tryParse(item.product?.price ?? '0') ?? 0) * item.quantity;
    }
    return total;
  }
}