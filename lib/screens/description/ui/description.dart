import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places_model.dart';
import 'package:travio/screens/description/controller/description.dart';
import 'package:travio/screens/home/controller/home.dart';
import 'package:travio/screens/mytrip/ui/widget/trip_card.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class CardDescription extends StatefulWidget {
  final PlacesModel places;
  const CardDescription({Key? key, required this.places}) : super(key: key);

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool val = false;
  var readMore = false;

  ScrollController scrollController = ScrollController();
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    DescriptionController descriptionController =
        Get.put(DescriptionController());
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
                    Image.network(widget.places.images[0].img,
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: screenWidthPercentage(context)),
                    Positioned(
                      top: 20.0,
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
                                    (widget.places.name.length > 18)
                                        ? widget.places.name.substring(0, 18) +
                                            '. . .'
                                        : widget.places.name,
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
                                      const Text(
                                        '78 %',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  horizontalSpaceTiny,
                                  const Icon(
                                    // (widget.places.prediction == 'Rise')
                                    //     ? CupertinoIcons.up_arrow
                                    //     : (widget.places.prediction == 'Fall')
                                    //         ? CupertinoIcons.down_arrow
                                    CupertinoIcons.arrow_up_arrow_down,
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
                          Text(widget.places.openingTime),
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
                          Text(widget.places.closingTime),
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
                  const Text(
                    'Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  verticalSpaceRegular,
                  ((widget.places.about.length <= 250 || readMore != false)
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              readMore = !readMore;
                            });
                          },
                          child: Text(
                            widget.places.about,
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              readMore = !readMore;
                            });
                          },
                          child: Text(
                            widget.places.about.substring(0, 250) + '. . . ',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ))
                ],
              ),
            ),
            Column(
              children: [
                verticalSpaceRegular,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    thickness: 1.4,
                  ),
                ),
                verticalSpaceRegular,
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Entry Fee',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  (widget.places.entryFee.isNotEmpty)
                      ? Column(
                          children: [
                            (widget.places.entryFee[0].indianEntryFee != 0)
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: value1,
                                              onChanged: (value) =>
                                                  setState(() {
                                                if (value == true) {
                                                  descriptionController
                                                          .totalPrice.value +=
                                                      widget.places.entryFee[0]
                                                          .indianEntryFee;
                                                } else {
                                                  descriptionController
                                                          .totalPrice.value -=
                                                      widget.places.entryFee[0]
                                                          .indianEntryFee;
                                                }
                                                this.value1 = value!;
                                              }),
                                            ),
                                            Text(
                                              'Indian Entry Fee',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                color: Colors.grey.shade600,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Rs. ' +
                                              widget.places.entryFee[0]
                                                  .indianEntryFee
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: value1
                                                ? color1
                                                : Colors.grey.shade600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            (widget.places.entryFee[0].foreignEntryFee != 0)
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: value2,
                                                onChanged: (value) =>
                                                    setState(() {
                                                  if (value == true) {
                                                    descriptionController
                                                            .totalPrice.value +=
                                                        widget
                                                            .places
                                                            .entryFee[0]
                                                            .foreignEntryFee;
                                                  } else {
                                                    descriptionController
                                                            .totalPrice.value -=
                                                        widget
                                                            .places
                                                            .entryFee[0]
                                                            .foreignEntryFee;
                                                  }
                                                  this.value2 = value!;
                                                }),
                                              ),
                                              Text(
                                                'Foreign Entry Fee',
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
                                          'Rs. ' +
                                              widget.places.entryFee[0]
                                                  .foreignEntryFee
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: value2
                                                ? color1
                                                : Colors.grey.shade600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            (widget.places.entryFee[0].photography != 0)
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: value3,
                                                onChanged: (value) =>
                                                    setState(() {
                                                  if (value == true) {
                                                    descriptionController
                                                            .totalPrice.value +=
                                                        widget
                                                            .places
                                                            .entryFee[0]
                                                            .photography;
                                                  } else {
                                                    descriptionController
                                                            .totalPrice.value -=
                                                        widget
                                                            .places
                                                            .entryFee[0]
                                                            .photography;
                                                  }
                                                  this.value3 = value!;
                                                }),
                                              ),
                                              Text(
                                                'Photography Fee',
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
                                          'Rs. ' +
                                              widget.places.entryFee[0]
                                                  .photography
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: value3
                                                ? color1
                                                : Colors.grey.shade600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            (widget.places.entryFee[0].videography != 0)
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: value4,
                                              onChanged: (value) =>
                                                  setState(() {
                                                if (value == true) {
                                                  descriptionController
                                                          .totalPrice.value +=
                                                      widget.places.entryFee[0]
                                                          .videography;
                                                } else {
                                                  descriptionController
                                                          .totalPrice.value -=
                                                      widget.places.entryFee[0]
                                                          .videography;
                                                }
                                                this.value4 = value!;
                                              }),
                                            ),
                                            Text(
                                              'Videography Fee',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                color: Colors.grey.shade600,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Rs. ' +
                                              widget.places.entryFee[0]
                                                  .videography
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: value4
                                                ? color1
                                                : Colors.grey.shade600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Column(
              children: [
                verticalSpaceRegular,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    thickness: 1.4,
                  ),
                ),
                verticalSpaceRegular,
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Packages',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: (widget.places.packages.isNotEmpty)
                          ? ListView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.places.packages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: (widget
                                              .places.packages[index].pkName ==
                                          '')
                                      ? const SizedBox()
                                      : Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      value: val,
                                                      onChanged: (value) =>
                                                          setState(() => this
                                                              .val = value!),
                                                    ),
                                                    Text(
                                                      widget
                                                          .places
                                                          .packages[index]
                                                          .pkName,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                'Rs. ' +
                                                    widget.places
                                                        .packages[index].pkPrice
                                                        .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: val
                                                      ? color1
                                                      : Colors.grey.shade600,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ],
                                          ),
                                        ),
                                );
                              },
                            )
                          : Center(
                              child: Text('No Packages available'),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            ShowTotal(
              places: widget.places,
            ),
            verticalSpaceLarge,
          ],
        ),
      )),
    );
  }
}

class ShowTotal extends StatelessWidget {
  final PlacesModel places;
  const ShowTotal({
    Key? key,
    required this.places,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DescriptionController descriptionController =
        Get.put(DescriptionController());
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
                Obx(
                  () => Text(
                    'Rs. ' + descriptionController.totalPrice.value.toString(),
                    style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              descriptionController.addWishlist(
                places.id,
                descriptionController.totalPrice.value.toString(),
              );
              Get.back();
            },
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
