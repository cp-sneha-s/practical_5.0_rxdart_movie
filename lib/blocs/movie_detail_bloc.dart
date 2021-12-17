import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _moviesId = PublishSubject<int>();
  final _movie = BehaviorSubject<Future<MovieList>>();

  Function(int) get fetchMovieById => _moviesId.sink.add;

  Stream<Future<MovieList>> get moviebyId => _movie.stream;

  MovieDetailBloc() {
    _moviesId.stream.transform(_itemTransFormer()).pipe(_movie);
  }

  dispose() async {
    _moviesId.close();
    await _movie.drain();
    _movie.close();
  }

  _itemTransFormer() {
    return ScanStreamTransformer((movie, int id, int index) {
      print(index);
      movie = _repository.fetchMovieById(id);
      return movie;
    }, <Future<MovieList>>{});
  }
}
