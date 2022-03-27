import 'package:get/get.dart';
import 'package:travio/models/places_model.dart';

import 'package:travio/services/network_handler.dart';

class DescriptionController extends GetxController {
  var totalPrice = 0.obs;
  final wishList = <PlacesModel>[].obs;
  NetworkHandler networkHandler = NetworkHandler();
  Future<void> addWishlist(String id, String totalPrice) async {
    wishList.value = await networkHandler
        .addWishlistNew("/add_wishlist", {'placeId': id, 'price': totalPrice});
  }
}
