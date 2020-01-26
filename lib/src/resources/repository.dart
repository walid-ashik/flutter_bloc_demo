
import 'package:flutter_bloc_architecture/src/models/item_model.dart';
import 'package:flutter_bloc_architecture/src/models/trailer_model.dart';
import 'package:flutter_bloc_architecture/src/resources/movie_api_provider.dart';

class Repository {
  MovieApiProvider movieApiProvider = new MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailer(int movieId) => movieApiProvider.fetchTrailer(movieId);

}