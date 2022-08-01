import 'package:dartz/dartz.dart';

class People {
  int page;
  List<PeopleResult> results;
  int totalResults;
  // int totalPage;

  People({
    required this.page,
    required this.results,
    required this.totalResults,
    // required this.totalPage,
  });
}

class PeopleResult {
  String profilePath;
  bool adult;
  int id;
  Either<List<KnownForLeft>, List<KnownForRight>> knownFor;
  String name;
  num popularity;

  PeopleResult({
    required this.profilePath,
    required this.adult,
    required this.id,
    required this.knownFor,
    required this.name,
    required this.popularity,
  });
}

class KnownForLeft {
  String? posterPath;
  bool adult;
  String overview;
  String releaseDate;
  String originalTitle;
  List<int> genreIds;
  int id;
  String mediaType;
  String originalLanguage;
  String title;
  String? backdropPath;
  int voteCount;
  bool video;
  num voteAverage;

  KnownForLeft({
    this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    this.backdropPath,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });
}

class KnownForRight {
  String? posterPath;
  int id;
  String overview;
  String? backdropPath;
  num voteAverage;
  String mediaType;
  String firstAirDate;
  List<String> originCountry;
  List<int> genreIds;
  String originalLanguage;
  int voteCount;
  String name;
  String originalName;

  KnownForRight({
    this.posterPath,
    required this.id,
    required this.overview,
    this.backdropPath,
    required this.voteAverage,
    required this.mediaType,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });
}
