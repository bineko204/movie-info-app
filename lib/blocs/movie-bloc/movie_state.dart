part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable{
  MovieState();
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {

}
class MovieLoadSuccess extends MovieState {
  final Movie movie;

  MovieLoadSuccess({@required this.movie}) : assert(movie != null);

  @override
  List<Object> get props => [movie];
  
}
class MovieLoadFailure extends MovieState {
  final String message;
  MovieLoadFailure({@required this.message}) : assert(message != null);
  @override
  List<Object> get props => [message];
}
class MovieLoadInProgress extends MovieState {
  
}
