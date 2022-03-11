import 'package:flutter/material.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController stateSearch = TextEditingController();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: color2,
      ),
      child: ListView(
        children: [
          verticalSpaceLarge,
          Search(searchController: stateSearch),
          
        ],
      ),
    ));
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: searchController,
          style: const TextStyle(height: 1),
          decoration: InputDecoration(
            hintText: 'Search State',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: color1,
              size: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ).copyWith(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ).copyWith(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ).copyWith(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
