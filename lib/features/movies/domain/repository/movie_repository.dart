import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_credits.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getPopularMovies(int? page);
  Future<Either<Failure, Movie>> getTopRatedMovies(int? page);
  Future<Either<Failure, Movie>> getNowPlayingMovies(int? page);
  Future<Either<Failure, Movie>> getUpcoming(int? page);
  Future<Either<Failure, Movie>> getRecommendations(int movieId);
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, MovieCredits>> getMovieCredits(int movieId);
  Future<Either<Failure, Review>> getReviews(int id);
  Future<Either<Failure, Images>> getImages(int id);
  Future<Either<Failure, MovieOrTvKeywords>> getKeywords(int movieId);
}