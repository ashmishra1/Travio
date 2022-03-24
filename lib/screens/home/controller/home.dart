import 'package:get/state_manager.dart';
import 'package:travio/models/places_model.dart';
import 'package:travio/services/network_handler.dart';

class HomeController extends GetxController {
  var selectedTag = 'All'.obs;

  final streamPlaces = <PlacesModel>[].obs;
  final streamReccomendedPlaces = <PlacesModel>[].obs;
  final streamCategoriesPlaces = <PlacesModel>[].obs;
  NetworkHandler networkHandler = NetworkHandler();

  // Future<void> getPlaces() async {
  //   streamPlaces.value = await networkHandler
  //       .getPlaces("/single_site", {'id': '623cb3597a21b65bd565db4a'});
  // }

  Future<void> getPlacesByCity(String city) async {
    streamPlaces.value =
        await networkHandler.getPlaces("/sites", {'param': city});
    streamReccomendedPlaces.value =
        await networkHandler.getPlaces("/recommended", {'param': city});
  }

  Future<void> getPlacesByCategories(String city, String category) async {
    streamCategoriesPlaces.value = await networkHandler
        .getPlaces("/category", {'param': city, 'category': category});
  }

  // void getPosts() {
  //   streamPlaces.bindStream(refreshPage());
  // }

  // Stream<List<PlacesModel>> refreshPage() async* {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   List<PlacesModel> somePlaces = await networkHandler
  //       .getPlaces("/single_site", {'id': '6234ae2e16fcc21029671be3'});
  //   yield somePlaces;
  // }
}
