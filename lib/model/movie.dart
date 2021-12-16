import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';


class MovieList{
  List<Movie> movieList;
  MovieList({required this.movieList});
  factory MovieList.fromJson(Map<String,dynamic> map){
    final data = map['Search'] as List<dynamic>;
    final list = data.map((e) => Movie.fromJson(e)).toList();
        return  MovieList(
              movieList: list);
  }
}

@JsonSerializable()
class Movie {
  String id;
  String title;
  String? imageUrl;
  String releaseYear;

  Movie({
    required this.id,
    required this.title,
     this.imageUrl,
    required this.releaseYear,
  });

  factory Movie.fromJson(Map<String, dynamic> map) => _$MovieFromJson(map);

  Map<String, dynamic> toJson(Movie movie) => _$MovieToJson(this);
}
