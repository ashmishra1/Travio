import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/screens/account/ui/account.dart';
import 'package:travio/screens/booking/ui/booking.dart';
import 'package:travio/screens/home/ui/home.dart';
import 'package:travio/screens/mytrip/ui/mytrip.dart';
import 'package:travio/screens/navbar/controller/navbar.dart';
import 'package:travio/utils/shared/app_colors.dart';

class Navbar extends StatelessWidget {
  Navbar({
    Key? key,
  }) : super(key: key);
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    NavbarController navbarContoller = Get.put(NavbarController());

    return GetBuilder<NavbarController>(builder: (_) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: [
            Icon(
              Icons.home_outlined,
              size: 30,
              color: navbarContoller.tabIndex.value == 0
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              CupertinoIcons.tickets,
              size: 30,
              color: navbarContoller.tabIndex.value == 1
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              Icons.time_to_leave_outlined,
              size: 30,
              color: navbarContoller.tabIndex.value == 2
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: navbarContoller.tabIndex.value == 3
                  ? Colors.white
                  : Colors.black,
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.indigoAccent.shade200,
          backgroundColor: color2,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            navbarContoller.changeTabIndex(index);
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: navbarContoller.tabIndex.value,
              children: [
                HomeScreen(),
                BookingScreen(),
                MyTripScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
