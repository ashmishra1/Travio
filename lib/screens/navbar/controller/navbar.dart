import 'package:get/state_manager.dart';

class NavbarController extends GetxController {
  var tabIndex = 0.obs;


  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
