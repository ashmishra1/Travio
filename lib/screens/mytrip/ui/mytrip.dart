import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places.dart';
import 'package:travio/screens/mytrip/controller/mytrip.dart';
import 'package:travio/screens/mytrip/ui/widget/sort_trip.dart';
import 'package:travio/screens/mytrip/ui/widget/trip_card.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

class MyTripScreen extends StatefulWidget {
  MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    MyTripController myTripController = Get.put(MyTripController());
    myTripController.getWishlistAll();
    myTripController.getPrice();
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
                      'my trip',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        myTripController.clearWishlist();
                        myTripController.wishList.value = [];
                      },
                      child: Text(
                        'Clear All',
                        style: TextStyle(color: color1, fontSize: 14.0),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceLarge,
              Obx(
                () => Container(
                  height: screenWidthPercentage(context, percentage: 1.18),
                  child: (myTripController.wishList.isNotEmpty)
                      ? ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            final place = myTripController.wishList[index];
                            return TripCard(
                              index: index,
                              key: ValueKey(place),
                              wishlist: myTripController.wishList[index],
                            );
                          },
                          itemCount: myTripController.wishList.length,
                        )
                      : Center(
                          child: Text(
                            "Oops! you have no destinations",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1.0,
                ),
              ),
              verticalSpaceRegular,
              const ShowTotal()
            ],
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
    MyTripController myTripController = Get.put(MyTripController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.0,
            width: screenWidthPercentage(context, percentage: 0.38),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style:
                        TextStyle(color: color1, fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Text(
                      'Rs. ' + myTripController.totalPrice.value.toString(),
                      style: TextStyle(
                          color: color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // myTripController.getWishlistAll();
              Get.to(() => const SortTrip());
            },
            child: Container(
              height: 50.0,
              width: screenWidthPercentage(context, percentage: 0.38),
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  'PROCEED',
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
