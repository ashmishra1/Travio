import 'package:get/get.dart';
import 'package:travio/screens/account/controller/account.dart';
import 'package:travio/screens/booking/controller/booking.dart';
import 'package:travio/screens/home/controller/home.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<BookingController>(
      () => BookingController(),
      fenix: true,
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
      fenix: true,
    );
  }
}

class AccountContoller {
}