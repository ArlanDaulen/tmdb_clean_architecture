import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.adult,
    super.backdropPath,
    super.belongsToCollection,
    required super.budget,
    required super.genres,
    super.homepage,
    required super.id,
    super.imdbId,
    required super.originalLanguage,
    required super.originalTitle,
    super.overview,
    required super.popularity,
    super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    super.runtime,
    required super.spokenLanguages,
    required super.status,
    super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final genres = <Genres>[];
    json['genres'].forEach((v) => genres.add(GenresModel.fromJson(v)));
    final prodCompanies = <ProductionCompanies>[];
    json['production_companies'].forEach(
        (v) => prodCompanies.add(ProductionCompaniesModel.fromJson(v)));
    final prodCountries = <ProdCountriesAndSpokeLang>[];
    json['production_countries'].forEach(
        (v) => prodCountries.add(ProdCountriesAndSpokeLangModel.fromJson(v)));
    final spokenLanguages = <ProdCountriesAndSpokeLang>[];
    json['spoken_languages'].forEach(
        (v) => spokenLanguages.add(ProdCountriesAndSpokeLangModel.fromJson(v)));
    return MovieDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: genres,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: prodCompanies,
      productionCountries: prodCountries,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: spokenLanguages,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class GenresModel extends Genres {
  GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }
}

class ProductionCompaniesModel extends ProductionCompanies {
  ProductionCompaniesModel({
    required super.name,
    required super.id,
    super.logoPath,
    required super.originCountry,
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
        name: json['name'],
        id: json['id'],
        logoPath: json['logo_path'],
        originCountry: json['origin_country']);
  }
}

class ProdCountriesAndSpokeLangModel extends ProdCountriesAndSpokeLang {
  ProdCountriesAndSpokeLangModel({required super.iso, required super.name});

  factory ProdCountriesAndSpokeLangModel.fromJson(Map<String, dynamic> json) {
    return ProdCountriesAndSpokeLangModel(
      iso: json.values.first,
      name: json['name'],
    );
  }
}
