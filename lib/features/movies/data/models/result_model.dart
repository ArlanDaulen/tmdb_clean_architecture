import 'dart:convert' as c;
import 'dart:developer';

import 'package:tmdb_clean_architecture/features/movies/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel(
      {super.posterPath,
      required super.adult,
      required super.overview,
      required super.releaseDate,
      required super.genreIds,
      required super.id,
      required super.originalTitle,
      required super.originalLanguage,
      required super.title,
      required super.popularity,
      super.backdropPath,
      required super.voteCount,
      required super.video,
      required super.voteAverage});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    final genres = <int>[];
    json['genre_ids'].forEach((v) => genres.add(v));
    return ResultModel(
      posterPath: json['poster_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      genreIds: genres,
      id: json['id'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      title: json['title'],
      popularity: json['popularity'],
      backdropPath: json['backdrop_path'],
      voteCount: json['vote_count'],
      video: json['video'],
      voteAverage: json['vote_average'],
    );
  }
}
