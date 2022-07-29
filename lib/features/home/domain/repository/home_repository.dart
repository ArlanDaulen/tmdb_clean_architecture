import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';

abstract class HomeRepositry {
  Future<Either<Failure, Tv>> getPopularTvs(int? page);
  Future<Either<Failure, Movie>> getPopularMovies(int? page);
  Future<Either<Failure, Tv>> getTopRatedTvs(int? page);
  Future<Either<Failure, Movie>> getTopRatedMovies(int? page);
  Future<Either<Failure, Tv>> getAiringTodayTvs(int? page);
  Future<Either<Failure, Movie>> getNowPlayingMovies(int? page);
}
