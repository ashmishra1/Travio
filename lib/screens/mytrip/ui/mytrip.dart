import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places.dart';
import 'package:travio/screens/mytrip/ui/widget/sort_trip.dart';
import 'package:travio/screens/mytrip/ui/widget/trip_card.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

List<Places> places = [
  const Places(
    name: "Lingaraj temple",
    category: "Temples",
    imageUrl:
        "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_611296796_20200218173507_20200218173559.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Rise',
  ),
  const Places(
    name: "Rajarani temple",
    category: "Temples",
    imageUrl:
        "https://res.cloudinary.com/thrillophilia/image/upload/c_fill,f_auto,fl_progressive.strip_profile,g_auto,h_600,q_auto,w_auto/v1/filestore/yiv7jim2ocipr092gkkmazqlznwo_1587447431_Rajarani_Temple.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 35.30,
    prediction: 'Fall',
  ),
  const Places(
    name: "Nico Park",
    category: "Parks",
    imageUrl:
        "https://bhubaneswartourism.in/images//tourist-places/ocean-world-water-park-bhubaneswar/ocean-world-water-park-bhubaneswar-tourism-entry-ticket-price.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Rise',
  ),
  const Places(
    name: "Nandankanan",
    category: "Parks",
    imageUrl: "https://i.ytimg.com/vi/QDjNR00WUbA/maxresdefault.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Same',
  ),
  const Places(
    name: "Nico Park",
    category: "Parks",
    imageUrl:
        "https://bhubaneswartourism.in/images//tourist-places/ocean-world-water-park-bhubaneswar/ocean-world-water-park-bhubaneswar-tourism-entry-ticket-price.jpg",
    isRecommended: true,
    isPopular: true,
    crowd: 25.80,
    prediction: 'Fall',
  ),
];

class MyTripScreen extends StatefulWidget {
  MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  ScrollController scrollController = ScrollController();
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
                    Text(
                      'my trip',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Clear All',
                        style: TextStyle(color: color1, fontSize: 14.0),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceLarge,
              Container(
                height: screenWidthPercentage(context, percentage: 1.18),
                child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return TripCard(
                      index: index,
                      key: ValueKey(place),
                    );
                  },
                  itemCount: places.length,
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1.0,
                ),
              ),
              verticalSpaceRegular,
              ShowTotal()
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
          ),
          InkWell(
            onTap: () {
              Get.to(() => SortTrip());
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
