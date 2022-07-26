import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';

abstract class MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final Either<Failure, Movie> popular;
  final Either<Failure, Movie> topeRated;
  final Either<Failure, Movie> nowPlaying;
  MoviesLoaded({
    required this.popular,
    required this.nowPlaying,
    required this.topeRated,
  });
}

class MoviesLoadError extends MoviesState {
  final String? message;
  MoviesLoadError({required this.message});
}


