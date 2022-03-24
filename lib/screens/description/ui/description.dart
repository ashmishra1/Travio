import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

class CardDescription extends StatefulWidget {
  final Places places;
  const CardDescription({Key? key, required this.places}) : super(key: key);

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
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
            Container(
              child: ClipRRect(
                child: Stack(
                  children: <Widget>[
                    Image.network(widget.places.imageUrl,
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: screenWidthPercentage(context)),
                    Positioned(
                      top: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.back,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.location,
                                    color: Colors.white,
                                  ),
                                  horizontalSpaceSmall,
                                  Text(
                                    widget.places.name,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Crowd',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        widget.places.crowd.toString() + '%',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  horizontalSpaceTiny,
                                  Icon(
                                    (widget.places.prediction == 'Rise')
                                        ? CupertinoIcons.up_arrow
                                        : (widget.places.prediction == 'Fall')
                                            ? CupertinoIcons.down_arrow
                                            : CupertinoIcons
                                                .arrow_up_arrow_down,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpaceRegular,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Opens at',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const Text('5:30 AM'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Closes at',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const Text('6:30 PM'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpaceRegular,
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
                  Text(
                    'Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  verticalSpaceRegular,
                  Text(
                    'This is the largest temple of Bhubaneswar. The architecture flaunts the medieval stages of tradition in Bhubaneswar of Kalinga Architecture. The temple is also one of the oldest temples to be built and believed to be built by the kings from the Somavamsi dynasty, with later additions from the Ganga rulers.',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            verticalSpaceRegular,
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
                  Text(
                    'Menu',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  verticalSpaceRegular,
                  Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (value) =>
                                        setState(() => this.value = value!),
                                  ),
                                  Text(
                                    'Temple Visit',
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
                              'Rs. 40',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: value ? color1 : Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (value) =>
                                        setState(() => this.value = value!),
                                  ),
                                  Text(
                                    'Mahaprasad Booking',
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
                              'Rs. 500',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: value ? color1 : Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            ShowTotal(),
          ],
        ),
      )),
    );
  }
}

class ShowTotal extends StatelessWidget {
  const ShowTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: color1, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Rs. 540',
                  style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50.0,
              width: screenWidthPercentage(context, percentage: 0.38),
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  'ADD TO TRIP',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
