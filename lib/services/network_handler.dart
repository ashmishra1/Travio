import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:travio/models/places.dart';
import 'package:travio/models/places_model.dart';

class NetworkHandler {
  String baseUrl = "https://travio69.herokuapp.com/api";
  var log = Logger();

  Future<bool> checkUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<PlacesModel>> getPlaces(
      String url, Map<String, String> body) async {
    url = formater(url);
    try {
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        List posts = jsonDecode(response.body);
        List<PlacesModel> allPosts =
            posts.map((json) => PlacesModel.fromJson(json)).toList();
        print(posts);
        // print(allPosts);

        return allPosts;
      } else {
        throw Exception('Failed to load posts');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    throw Exception('Failed to load posts');
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
