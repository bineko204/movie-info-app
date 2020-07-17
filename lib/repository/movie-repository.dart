import 'dart:async';

import 'package:MovieApp/models/movie.dart';
import 'package:MovieApp/repository/movie-api-client.dart';
import 'package:meta/meta.dart';

class MovieRepository {
  final MovieApiClient movieApiClient;

  MovieRepository({@required this.movieApiClient})
      : assert(movieApiClient != null);

  Future<Movie> getMovie(String movie) async {
    final jsonData = await movieApiClient.fetchMovieInfo(movie);
    final result = Movie(
      title: jsonData['Title'],
      released: jsonData['Released'],
      genre: jsonData['Genre'],
      runtime: jsonData['Runtime'],
      director: jsonData['Director'],
      plot: jsonData['Plot'],
      language: jsonData['Language'],
      poster: jsonData['Poster'],
      actors: jsonData['Actors'],
      response: jsonData['Response'],
    );
    return result;
  }
}
