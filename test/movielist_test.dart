// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';
import 'package:rxdart_example/resources/repository.dart';
import 'package:rxdart_example/service_locator.dart';

class MockNetworkDataProvider extends Mock implements NetworkDataProvider {
  @override
  Future<MovieList> fetchMovieListFromApi() {
    List<Movie> movieList = [
      Movie(id: '1', title: 'singham', releaseYear: '2000'),
      Movie(id: '2', title: 'vivah', releaseYear: '2001'),
      Movie(id: '3', title: 'rajneeti', releaseYear: '2002'),
      Movie(id: '4', title: 'pushpa', releaseYear: '2003')
    ];
    return Future.value(MovieList(movieList: movieList));
  }
}

void main() {
  setUpLocator();
  Repository repository = getIt<Repository>();
  repository.networkDataProvider = MockNetworkDataProvider();

  group('Given userList Page Loads', () {
    test('page should load a list of user from api', () async {
      List<Movie> myList =
          await repository.fetchAllMovies().then((value) => value.movieList);
      expect(myList.length, 4);
    });
  });
}
