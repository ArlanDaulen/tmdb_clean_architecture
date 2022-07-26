class MovieReview {
  int id;
  int page;
  List<ReviewResult> results;
  int totalPages;
  int totalResults;

  MovieReview({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class ReviewResult {
  String author;
  AuthorDetails authorDetails;
  String content;
  String createdAt;
  String id;
  String updatedAt;
  String url;

  ReviewResult({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
}

class AuthorDetails {
  String name;
  String username;
  String? avatarPath;
  double? rating;

  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });
}
