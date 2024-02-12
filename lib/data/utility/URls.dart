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

}