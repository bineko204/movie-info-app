
import 'package:MovieApp/blocs/bloc.dart';
import 'package:MovieApp/repository/repository.dart';
import 'package:MovieApp/screens/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MovieRepository movieRepository =
      MovieRepository(movieApiClient: MovieApiClient());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        home: BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(movieRepository: movieRepository),
          child: HomePage(),
        ));
  }
}
