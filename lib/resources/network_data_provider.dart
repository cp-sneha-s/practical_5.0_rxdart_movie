import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart_example/model/movie.dart';

class NetworkDataProvider {
  late Movie movie;

  Future<MovieList> fetchMovieListFromApi() async {
    http.Response response = await http.get(
      Uri.parse('https://fake-movie-database-api.herokuapp.com/api?s=batman'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      MovieList list = MovieList.fromJson(data);
      return list;
    } else {
      throw Exception('Could not load data');
    }
  }

  Future<Movie> fetchMoviebyId(String id) async {
    http.Response response = await http.get(
      Uri.parse('https://fake-movie-database-api.herokuapp.com/api?s=batman'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      MovieList list = MovieList.fromJson(data);
      for (int i = 0; i < list.movieList.length; i++) {
        Movie movie = list.movieList[i];
        if (movie.id == id) {
          return movie;
        }
      }
      return movie;
    } else {
      throw Exception('Could not load data');
    }
  }
}
