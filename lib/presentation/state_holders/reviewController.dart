import 'package:crafty_bay/data/models/ResponseDATA.dart';
import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/models/reviewList_model.dart';
import 'package:crafty_bay/data/service/Network_Caller.dart';
import 'package:crafty_bay/data/utility/URls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  ReviewListModel _reviews = ReviewListModel();

  ReviewListModel get reviews => _reviews;

  Future<bool> CreateReview(token,CreateProfile_params params) async {
    _inProgress = true;
    update();

    final response =
    await NetworkCaller().postRequest(Urls.createReview, token: token,body: params.toJson());

    _inProgress = false;

    if (response.isSuccess) {
      _reviews = ReviewListModel.fromJson(response.responseData['data']);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> getReview(int productID) async {
    _inProgress = true;
    update();

    final response =
    await NetworkCaller().getRequest(Urls.getReviewList(productID));

    _inProgress = false;

    if (response.isSuccess) {
      _reviews = ReviewListModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }




}
