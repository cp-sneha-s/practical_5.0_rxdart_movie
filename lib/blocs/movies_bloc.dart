import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  static final MoviesBloc bloc = MoviesBloc();
  final repository = Repository();
  final _moviesFetcher = PublishSubject<MovieList>();

   Stream<MovieList> get allMovies=> _moviesFetcher.stream;
  fetchAllMovies() async{
    MovieList movieList = await repository.fetchAllMovies();
    _moviesFetcher.sink.add(movieList);
  }

  dispose(){
    _moviesFetcher.close();
  }

}