import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/repository.dart';
import 'package:rxdart_example/service_locator.dart';

class MovieListBloc {
  final Repository _repository = getIt.get<Repository>();
  final _moviesFetcher = PublishSubject<MovieList>();

  Stream<MovieList> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MovieList _movieList = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(_movieList);
  }

  void dispose(){
    _moviesFetcher.close();
  }
}
