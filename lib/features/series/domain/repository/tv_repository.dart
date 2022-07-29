import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_credit.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_details.dart';
import 'package:tmdb_clean_architecture/shared/widgets/review.dart';

abstract class TvRepository {
  Future<Either<Failure, Tv>> getPopularTvs(int? page);
  Future<Either<Failure, Tv>> getTopRatedTvs(int? page);
  Future<Either<Failure, Tv>> getAiringTodayTvs(int? page);
  Future<Either<Failure, Tv>> getRecommendations(int tvId);
  Future<Either<Failure, TvDetails>> getTvDetails(int tvId);
  Future<Either<Failure, MovieOrTvKeywords>> getKeywords(int id);
  Future<Either<Failure, TvCredit>> getTvCredits(int tvId);
  Future<Either<Failure, Review>> getReviews(int id);
  Future<Either<Failure, Images>> getImages(int id);
  }
