// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
    id: json['imdbID'] as String,
    title: json['Title'] as String,
    imageUrl: json['Poster'] as String?,
    releaseYear: json['Year'] as String);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'imdbID': instance.id,
      'Title': instance.title,
      'imageUrl': instance.imageUrl,
      'Year': instance.releaseYear,
    };
