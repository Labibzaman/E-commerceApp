import 'package:crafty_bay/data/models/reviewList_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../service/Network_Caller.dart';
import '../utility/URls.dart';

class CreateReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  ReviewListModel _reviews = ReviewListModel();

  ReviewListModel get reviews => _reviews;

  Future<bool> CreateReview(
      int productId, int rating, String description) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "description": description,
      "product_id": productId,
      "rating": rating
    };
    final response = await NetworkCaller().postRequest(
      Urls.createReview,
      body: inputParams,
    );
    _inProgress = false;
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
