import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/features/movies/data/repository/movie_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';
import 'package:tmdb_clean_architecture/features/series/data/datasources/remote_datasource.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_credit.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_details.dart';
import 'package:tmdb_clean_architecture/features/series/domain/repository/tv_repository.dart';
import 'package:tmdb_clean_architecture/shared/widgets/review.dart';

class TvRepositoryImpl implements TvRepository {
  final _remoteDatasource = TvRemoteDatasourceImpl();

  @override
  Future<Either<Failure, Tv>> getPopularTvs(int? page) async {
    try {
      final result = await _remoteDatasource.getPopularTvs(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Tv>> getAiringTodayTvs(int? page) async {
    try {
      final result = await _remoteDatasource.getAiringTodayTvs(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Tv>> getTopRatedTvs(int? page) async {
    try {
      final result = await _remoteDatasource.getTopRatedTvs(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Tv>> getRecommendations(int tvId) async {
    try {
      final result = await _remoteDatasource.getRecommendations(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(int tvId) async {
    try {
      final result = await _remoteDatasource.getTvDetails(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, MovieOrTvKeywords>> getKeywords(int tvId) async {
    try {
      final result = await _remoteDatasource.getKeywords(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, TvCredit>> getTvCredits(int tvId) async {
    try {
      final result = await _remoteDatasource.getTvCredit(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Review>> getReviews(int tvId) async {
    try {
      final result = await _remoteDatasource.getTvReviews(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Images>> getImages(int tvId) async {
    try {
      final result = await _remoteDatasource.getTvImages(tvId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
