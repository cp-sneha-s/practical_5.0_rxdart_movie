import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  String id;
  String? imageUrl;
  String title;
  String year;

  MovieDetailScreen({
  required this.id,
  this.imageUrl,
  required this.title,
  required this.year});


  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Movie'),
            backgroundColor: Colors.teal,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network( widget.imageUrl??'https://images-na.ssl-images-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_.jpg',fit: BoxFit.cover,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Title: ${widget.title}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('Id: ${widget.id}',style: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
                      Text(' Release Year: ${widget.year} ',style: const TextStyle(fontSize: 15,fontStyle: FontStyle.normal),)
                    ],
                  ),
                )

              ],
            ),
          ),
        ));
  }
}
