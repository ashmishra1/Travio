import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/screens/mytrip/ui/widget/confirmation.dart';
import 'package:travio/screens/mytrip/ui/widget/trip_card.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

class SortTrip extends StatefulWidget {
  const SortTrip({Key? key}) : super(key: key);

  @override
  State<SortTrip> createState() => _SortTripState();
}

class _SortTripState extends State<SortTrip> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
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
                      're order',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'You can drag and drop the cards to reorder your trip',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
                ),
              ),
              verticalSpaceMedium,
              SizedBox(
                height: screenWidthPercentage(
                  context,
                  percentage: 1.18,
                  // 0.4 * places.length,
                ),
                child: ReorderableListView.builder(
                    scrollController: scrollController,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return TripCard(
                        index: index,
                        key: ValueKey(place),
                      );
                    },
                    itemCount: places.length,
                    onReorder: (oldIndex, newIndex) => setState(() {
                          final index =
                              newIndex > oldIndex ? newIndex - 1 : newIndex;
                          final place = places.removeAt(oldIndex);
                          places.insert(index, place);
                        })),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: BoxButton(
                  title: 'NEXT',
                  onTap: () {
                    Get.to(
                      () => const ConfirmationPage(),
                    );
                  },
                ),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
