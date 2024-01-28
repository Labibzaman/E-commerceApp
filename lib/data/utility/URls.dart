class Urls{

  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static  sendOTPemail(String email) => '$baseUrl/UserLogin/$email';
  static  VerifyOTPemail(String email,String otp) => '$baseUrl/VerifyLogin/$email/$otp';
  static  String ReadProfileURL = '$baseUrl/ReadProfile';
  static  String CreateProfileURL = '$baseUrl/CreateProfile';

}