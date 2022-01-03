import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';
import 'package:rxdart_example/service_locator.dart';

class Repository {
  var networkDataProvider = getIt<NetworkDataProvider>();

  Future<MovieList> fetchAllMovies() =>
      networkDataProvider.fetchMovieListFromApi();

  Future<Movie> fetchMovieById(String id) =>
      networkDataProvider.fetchMoviebyId(id);
}
