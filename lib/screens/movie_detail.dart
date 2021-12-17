import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_example/model/movie.dart';
import 'package:rxdart_example/resources/network_data_provider.dart';

class MovieDetailScreen extends StatefulWidget {
  String id;

  MovieDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  NetworkDataProvider networkDataProvider = NetworkDataProvider();
  late Future<Movie> futureMovie;

  @override
  void initState() {
    futureMovie = networkDataProvider.getMoviebyId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: futureMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Movie movie = snapshot.data as Movie;
              print(movie.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    movie.imageUrl ??
                        'https://images-na.ssl-images-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_.jpg',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Title: ${movie.title}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Id: ${movie.id}',
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        ' Release Year: ${movie.releaseYear} ',
                        style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.normal),
                      )
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              throw Exception('No movie found' + snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    ));
  }
}
