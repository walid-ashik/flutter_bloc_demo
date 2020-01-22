import 'dart:convert';
import 'package:flutter_bloc_architecture/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider{
  Client client = new Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<ItemModel> fetchMovieList() async {
    print('entered: fetchMovieList()');
    final response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
    print('response: ${response.body}');

    if(response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}