import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_example/blocs/movie_list_bloc.dart';
import 'package:rxdart_example/blocs/movies_bloc.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rxdart_example/service_locator.dart';

import 'movie_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieListBloc bloc = getIt<MovieListBloc>();

  @override
  void initState() {
    bloc.fetchAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Movies'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: bloc.allMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  MovieList list = snapshot.data as MovieList;
                  return GridView.builder(
                      itemCount: list.movieList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        Movie movie = list.movieList[index];
                        return InkWell(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailScreen(
                                          id: movie.id,
                                        )));
                          },
                          child: CachedNetworkImage(
                            imageUrl: movie.imageUrl ??
                                'https://images-na.ssl-images-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_.jpg',
                            // placeholder: (context, url) =>
                            //  const CircularProgressIndicator(),
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.error);
                            },
                            fit: BoxFit.cover,
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('Error: ' + snapshot.error.toString());
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )),
    );
  }
}
