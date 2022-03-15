import 'package:flutter/material.dart';
import 'package:travio/models/places.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

import 'widgets/categories_card.dart';

class CategoriesScreen extends StatelessWidget {
  final String type;
  const CategoriesScreen({Key? key, required this.type}) : super(key: key);

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
              child: Text(
                type,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            verticalSpaceMedium,
            CategoriesCarousel(
                places: Places.products
                    .where((product) => product.category == type)
                    .toList()),
          ],
        ),
      ),
    );
  }
}
