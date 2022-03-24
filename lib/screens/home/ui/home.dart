import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/category.dart';
import 'package:travio/models/places.dart';
import 'package:travio/screens/home/controller/home.dart';
import 'package:travio/screens/home/ui/widgets/hero_carousel_card.dart';
import 'package:travio/screens/home/ui/widgets/places_carousel.dart';
import 'package:travio/screens/location/ui/location.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

import 'widgets/city_tab.dart';
import 'widgets/places_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<String> places = [
      'Bhubaneswar',
      'Puri',
      'Koraput',
      'Cuttack',
      'Dhenkanal',
      'Nayagarh'
    ];

    ScrollController scrollController = ScrollController();
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.02),
      body: SafeArea(
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
                      'travio',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const LocationScreen());
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: color1,
                            size: 16,
                          ),
                          Text(
                            'Odisha',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                                color: color1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade100,
                ),
              ),
              verticalSpaceMedium,
              PlacesSearch(searchController: searchController),
              verticalSpaceMedium,
              CityTab(
                scrollController: scrollController,
                places: places,
                homeController: homeController,
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 4.0,
                          viewportFraction: 0.4,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                        ),
                        items: Category.categories
                            .map((category) =>
                                HeroCarouselCard(category: category))
                            .toList(),
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended for you',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpaceMedium,
                    PlacesCarousel(
                        places: Places.products
                            .where((product) => product.isRecommended)
                            .toList()),
                    verticalSpaceMedium,
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
