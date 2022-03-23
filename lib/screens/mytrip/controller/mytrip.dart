import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class MyTripController extends GetxController {
  var date = DateTime.now();
  var formatDate = ''.obs;
  var members = 1.obs;

  void getDate() {
    formatDate.value = DateFormat('yMd').format(date);
  }
}
