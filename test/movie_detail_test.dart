import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';
import 'package:rxdart_example/resources/repository.dart';
import 'package:rxdart_example/service_locator.dart';

class MockNetworkDataProvider extends Mock implements NetworkDataProvider {
  @override
  Future<Movie> fetchMoviebyId(String id) {
    return Future.value(
      Movie(id: '1', title: 'singham', releaseYear: '2000'),
    );
  }
}

void main() {
  setUpLocator();
  Repository repository = getIt<Repository>();
  repository.networkDataProvider = MockNetworkDataProvider();

  test('page should load a movie detail by it\'s id', () async {
    Movie movie =
        await repository.fetchMovieById(1.toString()).then((value) => value);
    expect(movie.id, '1');
    expect(movie.title, 'singham');
  });
}
