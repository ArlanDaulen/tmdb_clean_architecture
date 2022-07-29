import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_event.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';

abstract class HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final Either<Failure, Movie> popularMovies;
  final Either<Failure, Movie> topRatedMovies;
  final Either<Failure, Tv> popularTvs;
  final Either<Failure, Tv> topRatedTvs;

  Loaded({
    required this.popularMovies,
    required this.popularTvs,
    required this.topRatedMovies,
    required this.topRatedTvs,
  });
}

abstract class ToggleState {}

class LeftToggleChosen extends ToggleState {}
class RightToggleChosen extends ToggleState {}
