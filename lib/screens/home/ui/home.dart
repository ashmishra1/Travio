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
import 'package:travio/utils/widgets/box_input_field.dart';

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Explore',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        verticalSpaceSmall,
                        InkWell(
                          onTap: () {
                            Get.to(LocationScreen());
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: color1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.map))
                    // Container(
                    //   width: 60.0,
                    //   height: 60.0,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: NetworkImage(
                    //           'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=689&q=80'),
                    //     ),
                    //   ),
                    // ),
                  ],
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
              verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular places',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpaceMedium,
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 3.0,
                        viewportFraction: 0.5,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      items: Category.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
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
                      'Reccomended for you',
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