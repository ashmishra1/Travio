import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

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
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            const CustomTicket(),
            verticalSpaceRegular,
            const CustomTicket(),
            verticalSpaceRegular,
            const CustomTicket(),
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

class CustomTicket extends StatelessWidget {
  const CustomTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 150.0,
                width: screenWidthPercentage(context, percentage: 0.8),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade100,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
              Container(
                height: 150.0,
                width: screenWidthPercentage(context, percentage: 0.2),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        height: 50.0,
                        width: 50.0,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: QrImage(data: 'ling,nico,rani,barunei'),
                      ),
                      verticalSpaceRegular,
                      const Text(
                        '2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpaceTiny,
                      const Text(
                        'TICKETS',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      10.0,
                    ),
                    topLeft: Radius.circular(
                      10.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -8.0,
                left: screenWidthPercentage(context, percentage: 0.18),
                child: Container(
                  height: 16.0,
                  width: 16.0,
                  decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -8.0,
                left: screenWidthPercentage(context, percentage: 0.18),
                child: Container(
                  height: 16.0,
                  width: 16.0,
                  decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 160.0,
                  top: 50.0,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'travio',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          horizontalSpaceTiny,
                          Text(
                            'trips',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 20.0),
                          ),
                        ],
                      ),
                      verticalSpaceTiny,
                      const Center(
                        child: Text(
                          'Bhubaneswar, Konark, Puri',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 10.0),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
