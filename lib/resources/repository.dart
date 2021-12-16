import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';

class Repository{
  final NetworkDataProvider _networkDataProvider = NetworkDataProvider();

  Future<MovieList> fetchAllMovies() =>
    _networkDataProvider.fetchMovieListFromApi();

   Future<MovieList> fetchMovieById(int id)=>
       _networkDataProvider.fetchNovieListfromId(id);
}