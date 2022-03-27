import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:travio/models/places_model.dart';
import 'package:travio/services/network_handler.dart';

class MyTripController extends GetxController {
  var date = DateTime.now();
  var formatDate = ''.obs;
  var members = 1.obs;
  NetworkHandler networkHandler = NetworkHandler();

  void getDate() {
    formatDate.value = DateFormat('yMd').format(date);
  }

  var totalPrice = 0.obs;
  final wishList = <PlacesModel>[].obs;

  Future<void> getWishlistAll() async {
    wishList.value = await networkHandler.getWishlist(
      "/wishlist",
    );
  }

  Future<void> getPrice() async {
    totalPrice.value = await networkHandler.getTotalPrice(
      "/wishlist_price",
    );
  }

  Future<void> clearWishlist() async {
    totalPrice.value = await networkHandler.clearWishlist(
      "/clear_wishlist",
    );
  }
}
