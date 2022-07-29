import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_credit.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_details.dart';

abstract class SeriesDetailsState {}

class SeriesDetailsLoading extends SeriesDetailsState {}

class SeriesDetailsLoaded extends SeriesDetailsState {
  final TvDetails details;
  final Either<Failure, MovieOrTvKeywords> keywords;
  final Either<Failure, TvCredit> credits;
  final Either<Failure, Review> reviews;
  final Either<Failure, Images> images;
  final Either<Failure, Tv> recommendations;
  SeriesDetailsLoaded({
    required this.details,
    required this.keywords,
    required this.credits,
    required this.reviews,
    required this.images,
    required this.recommendations,
  });
}

class SeriesDetailsLoadError extends SeriesDetailsState {
  final String message;
  SeriesDetailsLoadError({required this.message});
}
