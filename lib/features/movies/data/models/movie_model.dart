import 'package:tmdb_clean_architecture/features/movies/data/models/result_model.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.page,
      required super.results,
      required super.totalResults,
      required super.totalPages});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final results = <MovieResultModel>[];
    json['results'].forEach((v) {
      results.add(MovieResultModel.fromJson(v));
    });
    return MovieModel(
      page: json['page'],
      results: results,
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }
}
