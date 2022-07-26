import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';

class MovieKeywordsModel extends MovieKeywords {
  MovieKeywordsModel({required super.id, required super.keywords});

  factory MovieKeywordsModel.fromJson(Map<String, dynamic> json) {
    final keywords = <Keywords>[];
    json['keywords'].forEach((v) => keywords.add(KeywordsModel.fromJson(v)));
    return MovieKeywordsModel(id: json['id'], keywords: keywords);
  }
}

class KeywordsModel extends Keywords {
  KeywordsModel({required super.id, required super.name});

  factory KeywordsModel.fromJson(Map<String, dynamic> json) {
    return KeywordsModel(id: json['id'], name: json['name']);
  }
}
