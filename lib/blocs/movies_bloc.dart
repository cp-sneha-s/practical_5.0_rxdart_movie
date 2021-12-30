import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/service_locator.dart';

class MoviesBloc {
  final repository = getIt.get<Repository>();
  final _movie = PublishSubject<Movie>();

  fetchMovieById(String id) async {
    Movie movie = await repository.fetchMovieById(id);
    _movie.sink.add(movie);
  }

  Stream<Movie> get movieDetail => _movie.stream;

  dispose() {
    _movie.close();
  }
}
