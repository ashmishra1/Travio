import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/screens/account/controller/account.dart';
import 'package:travio/screens/navbar/controller/navbar.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';
import 'package:travio/utils/widgets/box_text.dart';

import 'widget/list_card.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController accountcontroller = Get.put(AccountController());
    NavbarController navbarController = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: screenWidthPercentage(context, percentage: 0.33),
              ),
              verticalSpaceLarge,
              Container(
                margin: const EdgeInsets.only(
                  left: 20.0,
                ),
                alignment: Alignment.topLeft,
                child: const BoxText.headingThree(
                  'My Account',
                ),
              ),
              verticalSpaceRegular,
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                elevation: 4.0,
                child: Column(
                  children: [
                    ListCard(
                      onTap: () {
                        Get.rawSnackbar(
                          message: 'Coming soon!',
                          forwardAnimationCurve: Curves.easeIn,
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: kcLightBackgroundColor,
                          isDismissible: true,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      },
                      icon: Icons.person_outline,
                      title: 'Manage Profile',
                    ),
                    ListCard(
                      onTap: () {
                        Get.rawSnackbar(
                          message: 'Coming soon!',
                          forwardAnimationCurve: Curves.easeIn,
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: kcLightBackgroundColor,
                          isDismissible: true,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      },
                      icon: Icons.monetization_on_outlined,
                      title: 'Wallet',
                    ),
                    ListCard(
                      onTap: () {
                        Get.rawSnackbar(
                          message: 'Coming soon!',
                          forwardAnimationCurve: Curves.easeIn,
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: kcLightBackgroundColor,
                          isDismissible: true,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      },
                      icon: Icons.fact_check_outlined,
                      title: 'Tickets',
                    ),
                    ListCard(
                      onTap: () {},
                      icon: Icons.credit_card,
                      title: 'Wallet',
                    ),
                    ListCard(
                      onTap: () {
                        Get.rawSnackbar(
                          message: 'Coming soon!',
                          forwardAnimationCurve: Curves.easeIn,
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: kcLightBackgroundColor,
                          isDismissible: true,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      },
                      icon: Icons.share_outlined,
                      title: 'Invite Friends',
                    ),
                    ListCard(
                      onTap: () async {},
                      icon: Icons.contact_support_outlined,
                      title: 'Support',
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: BoxButton.outline(
                  title: 'LOGOUT',
                  onTap: () async {
                    // await gooleSignIn.signOut();
                    // await auth.signOut();
                    // notificationController.removeNotifications();
                    // Get.off(() => const Login());
                  },
                ),
              ),
            ],
          ),
          Container(
            height: screenWidthPercentage(context, percentage: 0.34),
            color: color1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                    ),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG_yIbHjzrzghXkTcOahJZn0eZCjyyLZ_lOg&usqp=CAU'),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
