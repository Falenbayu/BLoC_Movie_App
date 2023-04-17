import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/550?api_key=d38f3d18b578c04971c8405188c63d63");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
