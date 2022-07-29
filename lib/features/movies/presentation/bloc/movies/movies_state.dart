import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';

abstract class MoviesState {}

class MoviesLoading extends MoviesState {}

class PopularMoviesLoaded extends MoviesState {
  final Movie popular;
  PopularMoviesLoaded({required this.popular});
}

class TopRatedMoviesLoaded extends MoviesState {
  final Movie topRated;
  TopRatedMoviesLoaded({required this.topRated});
}

class UpcomingMoviesLoaded extends MoviesState {
  final Movie upcoming;
  UpcomingMoviesLoaded({required this.upcoming});
}

class NowPlayingMoviesLoaded extends MoviesState {
  final Movie nowPlaying;
  NowPlayingMoviesLoaded({required this.nowPlaying});
}

class MoviesLoadError extends MoviesState {
  final String message;
  MoviesLoadError({required this.message});
}
