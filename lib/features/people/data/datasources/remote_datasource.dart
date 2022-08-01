import 'dart:convert';
import 'dart:developer';

import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/features/people/data/models/people_model.dart';
import 'package:tmdb_clean_architecture/features/people/domain/entities/people.dart';
import 'package:http/http.dart' as http;

abstract class PeopleRemoteDatasource {
  Future<People> getPopularPeople(int? page);
}

class PeopleRemoteDatasourceImpl implements PeopleRemoteDatasource {
  final _client = http.Client();
  final _baseUrl = 'https://api.themoviedb.org/3/person/';
  final _apiKey = '7b79568d4e94ac70052f8e960cc7aa12';

  @override
  Future<People> getPopularPeople(int? page) async {
    final pageBody = page == null ? '' : '&page=$page';
    final response = await _client.get(Uri.parse(
        '${_baseUrl}popular?api_key=$_apiKey&language=en-US$pageBody'));
    if (response.statusCode == 200) {
      return PeopleModel.fromJson(json.decode(response.body));
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
