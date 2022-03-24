import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travio/screens/ticket/ui/ticket.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class CustomTicket extends StatelessWidget {
  const CustomTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => TicketScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  children: [
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
                              decoration:
                                  const BoxDecoration(color: Colors.white),
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
                    Container(
                      height: 150.0,
                      width: screenWidthPercentage(context, percentage: 0.6),
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade100,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                  ],
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
                    left: screenWidthPercentage(context, percentage: 0.6) / 2,
                    top: 50.0,
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'travio',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              horizontalSpaceTiny,
                              Text(
                                'trips',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.0),
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
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
