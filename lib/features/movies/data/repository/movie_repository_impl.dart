import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/core/network/network_info.dart';
import 'package:tmdb_clean_architecture/features/movies/data/datasources/remote_datasource.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final _remoteDatasource = MoviesRemoteDatasourceImpl();
  // final _localDatasource = MoviesLocalDatasourceImple();
  final _networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, Movie>> getPopularMovies(int? page) async {
    // if (await _networkInfo.isConnected) {
    //   try {
    //     final result = await _remoteDatasource.getPopularMovies(page);
    //     return Right(result);
    //   } on ServerException catch (e) {
    //     return Left(ServerFailure(message: e.message));
    //   }
    // } else {
    //   try {
    //     // TODO: realise Cache
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }

    try {
      final result = await _remoteDatasource.getPopularMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    try {
      final result = await _remoteDatasource.getMovieDetails(movieId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
  
  @override
  Future<Either<Failure, Movie>> getNowPlayingMovies(int? page) async {
    try {
      final result = await _remoteDatasource.getNowPlayingMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> getTopRatedMovies(int? page) async {
    try {
      final result = await _remoteDatasource.getTopRatedMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
