import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc_architecture/src/models/item_model.dart';
import 'package:flutter_bloc_architecture/src/ui/movie_details.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  @override
  void initState() {
    super.initState();
    //get movies from server, but all data will come from bloc itself
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie')),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error.toString()}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
            enableFeedback: true,
            onTap: () => navigateToMovieDetailsPage(snapshot.data, index),
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index]
                  .poster_path}',
              fit: BoxFit.cover,
            ),
          );
        });
  }

  navigateToMovieDetailsPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetails(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
          movieId: data.results[index].id,
        );
      })
    );
  }
}
