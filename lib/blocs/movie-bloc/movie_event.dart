part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {
  MovieEvent();
}

class MovieRequest extends MovieEvent {
  final String movieName;

  MovieRequest({@required this.movieName}) : assert(movieName != null);
  @override
  List<Object> get props => [movieName];
  
}