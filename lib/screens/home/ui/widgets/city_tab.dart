import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/screens/home/controller/home.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class CityTab extends StatelessWidget {
  const CityTab({
    Key? key,
    required this.scrollController,
    required this.places,
    required this.homeController,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<String> places;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) => Row(
          children: [
            InkWell(
                onTap: () {
                  homeController.selectedTag.value = places[index];
                  homeController
                      .getPlacesByCity(homeController.selectedTag.value);
                },
                child: Obx(
                  () => Row(
                    children: [
                      horizontalSpaceRegular,
                      Container(
                        decoration: BoxDecoration(
                          color: (homeController.selectedTag.value ==
                                  places[index])
                              ? null
                              : color1.withOpacity(0.1),
                          gradient: (homeController.selectedTag.value ==
                                  places[index])
                              ? grad1
                              : null,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            places[index],
                            style: TextStyle(
                                color: (homeController.selectedTag.value ==
                                        places[index])
                                    ? Colors.white
                                    : color1,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
