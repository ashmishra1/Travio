import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/places.dart';
import 'package:travio/models/places_model.dart';
import 'package:travio/screens/description/ui/description.dart';
import 'package:travio/screens/home/controller/home.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class CategoriesCarousel extends StatelessWidget {
  const CategoriesCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    ScrollController scrollController = ScrollController();
    return Obx(() => homeController.streamCategoriesPlaces.isEmpty
        ? SizedBox(
            height: screenHeightPercentage(context, percentage: 0.6),
            child: const Center(child: CircularProgressIndicator()),
          )
        : Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.streamCategoriesPlaces.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: CategoriesCard(
                        places: homeController.streamCategoriesPlaces[index]),
                  );
                }),
          ));
  }
}

class CategoriesCard extends StatelessWidget {
  final PlacesModel places;
  final double widthFactor;
  final bool isWishList;
  const CategoriesCard({
    Key? key,
    required this.places,
    this.widthFactor = 3.5,
    this.isWishList = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => CardDescription(places: places));
          },
          child: Container(
            margin: const EdgeInsets.only(
              right: 5.0,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(places.images[0].img,
                      fit: BoxFit.cover,
                      height: 180.0,
                      width: screenWidthPercentage(context) - 40.0),
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
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            places.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                                      '47%',
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
                                  // (places.prediction == 'Rise')
                                  //     ? CupertinoIcons.up_arrow
                                  //     : (places.prediction == 'Fall')
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
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
