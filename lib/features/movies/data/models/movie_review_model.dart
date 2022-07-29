import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required super.id,
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final results = <ReviewResult>[];
    json['results'].forEach((v) => ReviewResultModel.fromJson(v));
    return ReviewModel(
      id: json['id'],
      page: json['page'],
      results: results,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class ReviewResultModel extends ReviewResult {
  ReviewResultModel({
    required super.author,
    required super.authorDetails,
    required super.content,
    required super.createdAt,
    required super.id,
    required super.updatedAt,
    required super.url,
  });

  factory ReviewResultModel.fromJson(Map<String, dynamic> json) {
    return ReviewResultModel(
      author: json['author'],
      authorDetails: AuthorDetailsModel.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }
}

class AuthorDetailsModel extends AuthorDetails {
  AuthorDetailsModel({
    required super.name,
    required super.username,
    super.avatarPath,
    super.rating,
  });

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailsModel(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating'],
    );
  }
}
