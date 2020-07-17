import 'package:MovieApp/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image(
                      image: NetworkImage(movie.poster),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      movieDesc('Year Released', movie.released),
                      movieDesc('Genre', movie.genre),
                      movieDesc('Duration', movie.runtime),
                      movieDesc('Director', movie.director),
                      movieDesc('Actors', movie.actors),
                      movieDesc('Language', movie.language),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 50,
                    height: 3,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(movie.plot),
                ]),
          )
        ],
      ),
    );
  }

  Padding movieDesc(name, content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          text: '$name: ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: content, style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
