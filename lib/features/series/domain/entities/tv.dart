class Tv {
  int page;
  List<TvResult> results;
  int totalResults;
  int totalPages;

  Tv({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });
}

class TvResult {
  String? posterPath;
  num popularity;
  int id;
  String? backdropPath;
  num voteAverage;
  String overview;
  String firstAirDate;
  List<String> originCountry;
  List<int> genreIds;
  String originalLanguage;
  int voteCount;
  String name;
  String originalName;

  TvResult({
    this.posterPath,
    required this.popularity,
    required this.id,
    this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });
}
