import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class Main_bottom_controller extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if (_selectedIndex == index) {
      return;
    }

    if (index == 2 || index == 3) {
      if (Get.find<Auth_Controller>().isTokenNotNull == false) {
        Auth_Controller.goToLogin();
        return;
      }
    }

    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }
}