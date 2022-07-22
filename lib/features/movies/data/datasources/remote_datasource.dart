import 'dart:convert';
import 'dart:developer';

import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/features/movies/data/models/movie_details_model.dart';
import 'package:tmdb_clean_architecture/features/movies/data/models/movie_model.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';

abstract class MoviesRemoteDatasource {
  Future<Movie> getPopularMovies(int? page);
  Future<Movie> getTopRatedMovies(int? page);
  Future<Movie> getNowPlayingMovies(int? page);
  Future<MovieDetails> getMovieDetails(int movieId);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  final _client = http.Client();
  final _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final _apiKey = '7b79568d4e94ac70052f8e960cc7aa12';

  Future<Movie> _getMovies(int? page, String url) async {
    final pageBody = page == null ? '' : '&page=$page';
    final response = await _client.get(
        Uri.parse('$_baseUrl$url?api_key=$_apiKey&language=en-US$pageBody'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }

  @override
  Future<Movie> getPopularMovies(int? page) => _getMovies(page, 'popular');

  @override
  Future<Movie> getTopRatedMovies(int? page) => _getMovies(page, 'top_rated');

  @override
  Future<Movie> getNowPlayingMovies(int? page) =>
      _getMovies(page, 'now_playing');

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final response = await _client.get(
        Uri.parse('${_baseUrl}movie/$movieId?api_key=$_apiKey&language=en-US'));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(json.decode(response.body));
    } else {
      return handleError(response);
    }
  }
}

handleError(http.Response response) {
  log(response.statusCode.toString());
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
