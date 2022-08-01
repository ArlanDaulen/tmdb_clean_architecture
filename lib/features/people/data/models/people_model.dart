import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/features/people/domain/entities/people.dart';

class PeopleModel extends People {
  PeopleModel({
    required super.page,
    required super.results,
    required super.totalResults,
    // required super.totalPage,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    final results = <PeopleResult>[];
    json['results'].forEach((v) => results.add(PeopleResultModel.fromJson(v)));
    return PeopleModel(
      page: json['page'],
      results: results,
      totalResults: json['total_results'],
      // totalPage: json['total_page'],
    );
  }
}

class PeopleResultModel extends PeopleResult {
  PeopleResultModel({
    required super.profilePath,
    required super.adult,
    required super.id,
    required super.knownFor,
    required super.name,
    required super.popularity,
  });

  factory PeopleResultModel.fromJson(Map<String, dynamic> json) {
    // log(json['known_for'].first.keys.toString());
    Either<List<KnownForLeft>, List<KnownForRight>> knownFor;
    List<KnownForLeft> left = [];
    List<KnownForRight> right = [];
    json['known_for'].forEach((v) {
      if (v.keys.contains('video')) {
        left.add(KnownForLeftModel.fromJson(v));
      } else {
        right.add(KnownForRightModel.fromJson(v));
      }
    });
    if (json['known_for'].first.keys.contains('video')) {
      knownFor = Left(left);
    } else {
      knownFor = Right(right);
    }
    return PeopleResultModel(
      profilePath: json['profile_path'],
      adult: json['adult'],
      id: json['id'],
      knownFor: knownFor,
      name: json['name'],
      popularity: json['popularity'],
    );
  }
}

class KnownForLeftModel extends KnownForLeft {
  KnownForLeftModel({
    super.posterPath,
    required super.adult,
    required super.overview,
    required super.releaseDate,
    required super.originalTitle,
    required super.genreIds,
    required super.id,
    required super.mediaType,
    required super.originalLanguage,
    required super.title,
    super.backdropPath,
    required super.voteCount,
    required super.video,
    required super.voteAverage,
  });

  factory KnownForLeftModel.fromJson(Map<String, dynamic> json) {
    final genreIds = <int>[];
    json['genre_ids'].forEach((v) => genreIds.add(v));
    return KnownForLeftModel(
      posterPath: json['poster_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      originalTitle: json['original_title'],
      genreIds: genreIds,
      id: json['id'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      title: json['title'],
      voteCount: json['vote_count'],
      video: json['video'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
    );
  }
}

class KnownForRightModel extends KnownForRight {
  KnownForRightModel({
    super.posterPath,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.mediaType,
    required super.firstAirDate,
    required super.originCountry,
    required super.genreIds,
    required super.originalLanguage,
    required super.voteCount,
    required super.name,
    required super.originalName,
    super.backdropPath,
  });

  factory KnownForRightModel.fromJson(Map<String, dynamic> json) {
    final originCountry = <String>[];
    json['origin_country'].forEach((v) => originCountry.add(v));
    final genreIds = <int>[];
    json['genre_ids'].forEach((v) => genreIds.add(v));
    return KnownForRightModel(
      posterPath: json['poster_path'],
      id: json['id'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      mediaType: json['media_type'],
      firstAirDate: json['first_air_date'],
      originCountry: originCountry,
      genreIds: genreIds,
      originalLanguage: json['original_language'],
      voteCount: json['vote_count'],
      name: json['name'],
      originalName: json['original_name'],
    );
  }
}
