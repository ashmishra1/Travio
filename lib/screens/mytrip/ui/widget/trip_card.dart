import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places.dart';
import 'package:travio/models/places_model.dart';
import 'package:travio/screens/mytrip/controller/mytrip.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class TripCard extends StatelessWidget {
  PlacesModel wishlist;
  TripCard({
    Key? key,
    required this.index,
    required this.wishlist,
  }) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    MyTripController myTripController = Get.put(MyTripController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: FittedBox(
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Image.network(
                        myTripController.wishList[index].images[0].img,
                        fit: BoxFit.cover,
                        width: 200.0),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.white38,
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        left: 16.0,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 140.0,
              width: screenWidthPercentage(context, percentage: 0.4),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: const BorderRadius.only(
                  topRight: const Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishlist.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan.shade700,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        wishlist.city + ', ' + wishlist.state,
                        style: TextStyle(
                          fontSize: 11.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.cyan.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
