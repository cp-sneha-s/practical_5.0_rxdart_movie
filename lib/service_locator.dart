import 'package:get_it/get_it.dart';
import 'package:rxdart_example/blocs/movie_list_bloc.dart';
import 'package:rxdart_example/blocs/movies_bloc.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';
import 'package:rxdart_example/resources/repository.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton(() => Repository());
  getIt.registerSingleton(NetworkDataProvider());
  getIt.registerLazySingleton(() => MovieListBloc());
  getIt.registerLazySingleton(() => MoviesBloc());
}
