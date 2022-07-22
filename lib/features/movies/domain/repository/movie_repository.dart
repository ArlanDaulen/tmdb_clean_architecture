import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getPopularMovies(int? page);
  Future<Either<Failure, Movie>> getTopRatedMovies(int? page);
  Future<Either<Failure, Movie>> getNowPlayingMovies(int? page);
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
}