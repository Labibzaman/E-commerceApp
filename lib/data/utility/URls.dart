class Urls{

  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static  sendOTPemail(String email) => '$baseUrl/userLogin/$email';

}