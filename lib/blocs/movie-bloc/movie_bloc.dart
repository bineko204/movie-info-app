import 'dart:async';

import 'package:MovieApp/models/movie.dart';
import 'package:MovieApp/repository/movie-repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
   final MovieRepository movieRepository;

  MovieBloc({@required this.movieRepository}) : assert(movieRepository != null),super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if(event is MovieRequest){
      yield MovieLoadInProgress();
      try{
        final Movie movie = await movieRepository.getMovie(event.movieName);
        if(movie.response == 'True'){
          yield MovieLoadSuccess(movie: movie);
        } else yield MovieLoadFailure(message: 'Không tìm thấy phim');
      }catch(_){
        MovieLoadFailure(message: 'Có lỗi xảy ra trong quá trình tìm kiếm!');
      }
    }
  }
}
