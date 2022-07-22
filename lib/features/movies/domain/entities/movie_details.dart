class MovieDetails {
  bool adult;
  String? backdropPath;
  Object? belongsToCollection;
  int budget;
  List<Genres> genres;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String? overview;
  num popularity;
  String? posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProdCountriesAndSpokeLang> productionCountries;
  String releaseDate;
  int revenue;
  int? runtime;
  List<ProdCountriesAndSpokeLang> spokenLanguages;
  String status;
  String? tagline;
  String title;
  bool video;
  num voteAverage;
  int voteCount;

  MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}

class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});
}

class ProductionCompanies {
  String name;
  int id;
  String? logoPath;
  String originCountry;

  ProductionCompanies({
    required this.name,
    required this.id,
    this.logoPath,
    required this.originCountry,
  });
}

class ProdCountriesAndSpokeLang {
  String iso;
  String name;

  ProdCountriesAndSpokeLang({required this.iso, required this.name});
}
