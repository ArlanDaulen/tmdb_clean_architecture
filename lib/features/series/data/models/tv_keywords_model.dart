import 'package:tmdb_clean_architecture/features/movies/data/models/movie_keywords_model.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';

class TvKeywordsModel extends MovieOrTvKeywords {
  TvKeywordsModel({required super.id, required super.keywords});

  factory TvKeywordsModel.fromJson(Map<String, dynamic> json) {
    final keywords = <Keywords>[];
    json['results'].forEach((v) => keywords.add(KeywordsModel.fromJson(v)));
    return TvKeywordsModel(id: json['id'], keywords: keywords);
  }
}
