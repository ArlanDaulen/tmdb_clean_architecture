
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';

class TvModel extends Tv {
  TvModel({
    required super.page,
    required super.results,
    required super.totalResults,
    required super.totalPages,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    final results = <TvResult>[];
    json['results'].forEach((v) => results.add(TvResultModel.fromJson(v)));
    return TvModel(
      page: json['page'],
      results: results,
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }
}

class TvResultModel extends TvResult {
  TvResultModel({
    super.posterPath,
    required super.popularity,
    required super.id,
    super.backdropPath,
    required super.voteAverage,
    required super.overview,
    required super.firstAirDate,
    required super.originCountry,
    required super.genreIds,
    required super.originalLanguage,
    required super.voteCount,
    required super.name,
    required super.originalName,
  });

  factory TvResultModel.fromJson(Map<String, dynamic> json) {
    final originCountry = <String>[];
    json['origin_country'].forEach((v) => originCountry.add(v));
    final genreIds = <int>[];
    json['genre_ids'].forEach((v) => genreIds.add(v));
    return TvResultModel(
      posterPath: json['poster_path'],
      popularity: json['popularity'],
      id: json['id'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
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
