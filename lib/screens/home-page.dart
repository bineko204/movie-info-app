import 'package:MovieApp/blocs/movie-bloc/movie_bloc.dart';
import 'package:MovieApp/widgets/movie-detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.greenAccent,
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhập tên phim',
                  ),
                  controller: controller,
                  onSubmitted: (text) {
                    if (text != '') {
                      BlocProvider.of<MovieBloc>(context)
                          .add(MovieRequest(movieName: text));
                    }
                  },
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieLoadSuccess) {
            final movie = state.movie;
            return GestureDetector(
              // Close keyboard onclick outside
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: MovieDetail(movie: movie),
            );
          }
          if (state is MovieLoadFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(child: Text("Nhập tên phim"));
        },
      ),
    );
  }
}
