import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travio/models/category.dart';
import 'package:travio/screens/categories/ui/categories.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  // final Product? product;
  const HeroCarouselCard({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
        Get.to(CategoriesScreen(
          type: category!.name,
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    category == null ? category!.imageUrl : category!.imageUrl,
                    fit: BoxFit.cover,
                    width: 200.0),
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
                    child: Center(
                      child: Text(
                        category!.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
