import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:travio/models/places.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.orange.withOpacity(0.05),
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
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            size: 20.0,
                          ),
                        ),
                        horizontalSpaceSmall,
                        const Text(
                          'ticket',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: color1),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: QrImage(data: 'ling,nico,rani,barunei'),
                  )),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Center(
                child: Text(
                  '26 March 2022',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            verticalSpaceLarge,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 1.4,
              ),
            ),
            verticalSpaceRegular,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: const Text(
                    'Details',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Ashutosh Mishra',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: color1,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'ashutoshmishra123@gmail.com',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: color1,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Rs. 540',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: color1,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Members',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: color1,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 1.4,
              ),
            ),
            verticalSpaceRegular,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.8),
                    height: 100,
                    child: TimelineTile(
                      // axis: TimelineAxis.vertical,
                      endChild: const TimelineCard(),
                      beforeLineStyle: const LineStyle(color: kcLightGreyColor),
                      afterLineStyle: const LineStyle(color: kcLightGreyColor),
                      isFirst: true,
                      indicatorStyle: IndicatorStyle(
                        color: Colors.grey.shade300,
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.8),
                    height: 100,
                    child: TimelineTile(
                      // axis: TimelineAxis.vertical,
                      endChild: const TimelineCard(),
                      beforeLineStyle: const LineStyle(color: kcLightGreyColor),
                      afterLineStyle: const LineStyle(color: kcLightGreyColor),
                      indicatorStyle: IndicatorStyle(
                        color: Colors.grey.shade300,
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.8),
                    height: 100,
                    child: TimelineTile(
                      beforeLineStyle: const LineStyle(color: kcLightGreyColor),
                      afterLineStyle: const LineStyle(color: kcLightGreyColor),
                      indicatorStyle: IndicatorStyle(
                        color: Colors.grey.shade300,
                        width: 15.0,
                        height: 15.0,
                      ),
                      endChild: const TimelineCard(),
                      isLast: true,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceRegular,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: const BoxButton(title: 'DOWNLOAD'),
            ),
            verticalSpaceLarge,
          ],
        ),
      )),
    );
  }
}

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
              color: color1.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10.0)),
          width: screenWidthPercentage(
            context,
            percentage: 0.7,
          ),
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpaceSmall,
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://res.cloudinary.com/thrillophilia/image/upload/c_fill,f_auto,fl_progressive.strip_profile,g_auto,h_600,q_auto,w_auto/v1/filestore/yiv7jim2ocipr092gkkmazqlznwo_1587447431_Rajarani_Temple.jpg'),
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Text(
                  'Raja Rani Temple',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color1.withOpacity(0.9),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
