import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

import 'widget/custom_ticket.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05)),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'tickets',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            CustomTicket(),
            verticalSpaceRegular,
            CustomTicket(),
            verticalSpaceRegular,
            CustomTicket(),
            // SvgPicture.asset(
            //   'assets/tickets/ticket_card.svg',
            //   height: 145.0,
            //   width: 145.0,
            //   allowDrawingOutsideViewBox: true,
            // ),
          ],
        ),
      ),
    );
  }
}
