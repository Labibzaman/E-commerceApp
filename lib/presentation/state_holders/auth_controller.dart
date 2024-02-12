import 'dart:convert';

import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth_Controller extends GetxController {
  static String? token;
  Profile? profile;

  Future<void> saveUserInformation(String t, Profile p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', t);
    sharedPreferences.setString('profile', jsonEncode(p.toJson()));

    token = t;
    profile = p;
  }

  Future<void> initilize() async {
    token = await getToken();
    profile = await getProfile();
  }

  Future<bool> isLoggedIn() async {
    await initilize();
    return token != null;
  }
  bool get isTokenNotNull => token !=null;

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  static Future<void> clearDATA()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.clear();
   token=null;
  }

  Future<Profile?> getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = await sharedPreferences.getString('profile');
    if (strProfile == null) {
      return null;
    } else {
      return Profile.fromJson(jsonDecode(strProfile));
    }
  }

  static Future<void>goToLogin() async{
    Get.to(()=>const VerifyEmailScreen());
  }

}
