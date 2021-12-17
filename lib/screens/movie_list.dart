import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_example/blocs/movies_bloc.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/repository.dart';

import 'movie_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviesBloc bloc = MoviesBloc();

  @override
  void initState() {
    bloc.fetchAllMovies();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Movie'),
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
                          child: Image.network(
                            movie.imageUrl ??
                                'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg',
                            height: 100,
                            width: 100,
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
