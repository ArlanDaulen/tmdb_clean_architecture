import 'package:tmdb_clean_architecture/features/movies/domain/entities/result.dart';

class Movie {
  final int page;
  final List<MovieResult> results;
  final int totalResults;
  final int totalPages;

  Movie({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });
}
