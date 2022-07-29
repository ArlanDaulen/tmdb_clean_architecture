import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/features/home/domain/repository/home_repository.dart';
import 'package:tmdb_clean_architecture/features/movies/data/repository/movie_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/series/data/repository/tv_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';

class HomeRepositryimpl implements HomeRepositry {
  final _tvRepository = TvRepositoryImpl();
  final _movieRepository = MovieRepositoryImpl();

  @override
  Future<Either<Failure, Tv>> getPopularTvs(int? page) async =>
      await _tvRepository.getPopularTvs(page);

  @override
  Future<Either<Failure, Tv>> getTopRatedTvs(int? page) async =>
      await _tvRepository.getTopRatedTvs(page);

  @override
  Future<Either<Failure, Tv>> getAiringTodayTvs(int? page) async =>
      await _tvRepository.getAiringTodayTvs(page);

  @override
  Future<Either<Failure, Movie>> getPopularMovies(int? page) async =>
      await _movieRepository.getPopularMovies(page);

  @override
  Future<Either<Failure, Movie>> getTopRatedMovies(int? page) async =>
      await _movieRepository.getTopRatedMovies(page);

  @override
  Future<Either<Failure, Movie>> getNowPlayingMovies(int? page) async =>
      await _movieRepository.getNowPlayingMovies(page);
}
