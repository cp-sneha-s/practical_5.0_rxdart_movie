import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart_example/model/movie.dart';

class NetworkDataProvider {
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


  Future<MovieList> fetchNovieListfromId(int id) async{
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
}
