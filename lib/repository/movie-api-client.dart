import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class MovieApiClient {
  final String endpointURL = 'http://www.omdbapi.com';
  final String apiKey = '3491fb5b';
  
  Future fetchMovieInfo(String title) async {
    final apiURL = '$endpointURL/?apikey=$apiKey&t=$title&plot=full';
    final movieResponse = await http.get(apiURL);

    if (movieResponse.statusCode != 200) {
      throw Exception('Có lỗi xảy ra');
    }

    final dataJSON = jsonDecode(movieResponse.body);
    
    return dataJSON;
   
  }
}
