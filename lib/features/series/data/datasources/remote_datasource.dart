import 'dart:convert';

import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/features/movies/data/models/movie_images_model.dart';
import 'package:tmdb_clean_architecture/features/movies/data/models/movie_keywords_model.dart';
import 'package:tmdb_clean_architecture/features/movies/data/models/movie_review_model.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';
import 'package:tmdb_clean_architecture/features/series/data/models/tv_credit_model.dart';
import 'package:tmdb_clean_architecture/features/series/data/models/tv_details_model.dart';
import 'package:tmdb_clean_architecture/features/series/data/models/tv_keywords_model.dart';
import 'package:tmdb_clean_architecture/features/series/data/models/tv_model.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_credit.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_details.dart';

abstract class TvRemoteDatasource {
  Future<Tv> getPopularTvs(int? page);
  Future<Tv> getTopRatedTvs(int? page);
  Future<Tv> getAiringTodayTvs(int? page);
  Future<Tv> getRecommendations(int tvId);
  Future<TvDetails> getTvDetails(int tvId);
  Future<TvCredit> getTvCredit(int tvId);
  Future<Review> getTvReviews(int tvId);
  Future<Images> getTvImages(int tvId);
  Future<MovieOrTvKeywords> getKeywords(int tvId);
}

class TvRemoteDatasourceImpl implements TvRemoteDatasource {
  final _client = http.Client();
  final _baseUrl = 'https://api.themoviedb.org/3/tv/';
  final _apiKey = '7b79568d4e94ac70052f8e960cc7aa12';

  Future<Tv> _getTvs(int? page, String url) async {
    final pageBody = page == null ? '' : '&page=$page';
    final response = await _client.get(
        Uri.parse('$_baseUrl$url?api_key=$_apiKey&language=en-US$pageBody'));
    if (response.statusCode == 200) {
      return TvModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<Tv> getPopularTvs(int? page) => _getTvs(page, 'popular');

  @override
  Future<Tv> getAiringTodayTvs(int? page) => _getTvs(page, 'airing_today');

  @override
  Future<Tv> getTopRatedTvs(int? page) => _getTvs(page, 'top_rated');

  @override
  Future<TvDetails> getTvDetails(int tvId) async {
    final response = await _client
        .get(Uri.parse('$_baseUrl$tvId?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<TvCredit> getTvCredit(int tvId) async {
    final response = await _client.get(
        Uri.parse('$_baseUrl$tvId/credits?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return TvCreditModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<Tv> getRecommendations(int tvId) async {
    final response = await _client.get(Uri.parse(
        '$_baseUrl$tvId/recommendations?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return TvModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<Review> getTvReviews(int tvId) async {
    final response = await _client.get(
        Uri.parse('$_baseUrl$tvId/reviews?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return ReviewModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<MovieOrTvKeywords> getKeywords(int tvId) async {
    final response = await _client.get(
        Uri.parse('$_baseUrl$tvId/keywords?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return TvKeywordsModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<Images> getTvImages(int tvId) async {
    final response = await _client.get(
        Uri.parse('$_baseUrl$tvId/images?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return ImagesModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }
}

handleError(http.Response response) {
  final message = json.decode(response.body)['status_message'];
  switch (response.statusCode) {
    case 404:
      throw ServerException(message: message);
    case 401:
      // TODO: return to Login Page
      break;
    default:
      throw ServerException(message: "Something went wrong ipat'");
  }
}
