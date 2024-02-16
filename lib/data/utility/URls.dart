import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';

class Urls{

  static const String baseUrl = 'http://ecom-api.teamrabbil.com/api';

  static  sendOTPemail(String email) => '$baseUrl/UserLogin/$email';
  static  VerifyOTPemail(String email,String otp) => '$baseUrl/VerifyLogin/$email/$otp';
  static  String ReadProfileURL = '$baseUrl/ReadProfile';
  static  String CreateProfileURL = '$baseUrl/CreateProfile';
  static  String ProductListSlider = '$baseUrl/ListProductSlider';
  static  String categoryList = '$baseUrl/CategoryList';
  static  String popularList = '$baseUrl/ListProductByRemark/Popular';
  static  String SpecialList = '$baseUrl/ListProductByRemark/Special';
  static  String NewList = '$baseUrl/ListProductByRemark/New';
  static  String ListbyCategory(int CategoryID) => '$baseUrl/ListProductByCategory/${CategoryID}';
  static  String ProductListDetails(int ProductID) => '$baseUrl/ProductDetailsById/${ProductID}';
  static  String addToCart = '$baseUrl/CreateCartList';
  static  String cartList = '$baseUrl/CartList';
  static  String wishList = '$baseUrl/ProductWishList';
  static  String removeWishList(int productID) => '$baseUrl/RemoveWishList/$productID';
  static  String createWishList(int productID) => '$baseUrl/CreateWishList/$productID';
  static  String createInvoice = '$baseUrl/InvoiceCreate';
  static  String createReview = '$baseUrl/CreateProductReview';
  static  String getReviewList(int productID) => '$baseUrl/ListReviewByProduct/${productID}';

}