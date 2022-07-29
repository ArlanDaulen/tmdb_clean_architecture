import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  TvDetailsModel({
    super.backdropPath,
    required super.createdBy,
    required super.episodeRunTime,
    required super.firstAirDate,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.inProduction,
    required super.languages,
    required super.lastAirDate,
    required super.lastEpisodeToAir,
    required super.name,
    required super.networks,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.seasons,
    required super.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    final createdBy = <CreatedBy>[];
    json['created_by']
        .forEach((v) => createdBy.add(CreatedByModel.fromJson(v)));
    final episodeRunTime = <int>[];
    json['episode_run_time'].forEach((v) => episodeRunTime.add(v));
    final genres = <SeriesGenre>[];
    json['genres'].forEach((v) => genres.add(SeriesGenreModel.fromJson(v)));
    final languages = <String>[];
    json['languages'].forEach((v) => languages.add(v));
    final networks = <NetworksAndProdCompanies>[];
    json['networks'].forEach(
        (v) => networks.add(NetworksAndProdCompaniesModel.fromJson(v)));
    final originCountry = <String>[];
    json['origin_country'].forEach((v) => originCountry.add(v));
    final productionCompanies = <NetworksAndProdCompanies>[];
    json['production_companies'].forEach((v) =>
        productionCompanies.add(NetworksAndProdCompaniesModel.fromJson(v)));
    final productionCountries = <ProductionCountry>[];
    json['production_countries'].forEach(
        (v) => productionCountries.add(ProductionCountryModel.fromJson(v)));
    final seasons = <Season>[];
    json['seasons'].forEach((v) => seasons.add(SeasonModel.fromJson(v)));
    final spokenLanguages = <SpokenLanguage>[];
    json['spoken_languages']
        .forEach((v) => spokenLanguages.add(SpokenLanguageModel.fromJson(v)));
    return TvDetailsModel(
      backdropPath: json['backdrop_path'],
      createdBy: createdBy,
      episodeRunTime: episodeRunTime,
      firstAirDate: json['first_air_date'],
      genres: genres,
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: languages,
      lastAirDate: json['last_air_date'],
      lastEpisodeToAir:
          LastEpisodeToAirModel.fromJson(json['last_episode_to_air']),
      name: json['name'],
      networks: networks,
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: originCountry,
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: productionCompanies,
      productionCountries: productionCountries,
      seasons: seasons,
      spokenLanguages: spokenLanguages,
      status: json['status'],
      tagline: json['tagline'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class CreatedByModel extends CreatedBy {
  CreatedByModel({
    required super.id,
    required super.creditId,
    required super.name,
    required super.gender,
    super.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) {
    return CreatedByModel(
      id: json['id'],
      creditId: json['credit_id'],
      name: json['name'],
      gender: json['gender'],
      profilePath: json['profile_path'],
    );
  }
}

class SeriesGenreModel extends SeriesGenre {
  SeriesGenreModel({required super.id, required super.name});

  factory SeriesGenreModel.fromJson(Map<String, dynamic> json) {
    return SeriesGenreModel(id: json['id'], name: json['name']);
  }
}

class NetworksAndProdCompaniesModel extends NetworksAndProdCompanies {
  NetworksAndProdCompaniesModel({
    required super.id,
    required super.name,
    required super.originCountry,
    super.logoPath,
  });

  factory NetworksAndProdCompaniesModel.fromJson(Map<String, dynamic> json) {
    return NetworksAndProdCompaniesModel(
      id: json['id'],
      name: json['name'],
      originCountry: json['origin_country'],
      logoPath: json['logo_path'],
    );
  }
}

class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({required super.iso_3166_1, required super.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
        iso_3166_1: json['iso_3166_1'], name: json['name']);
  }
}

class SeasonModel extends Season {
  SeasonModel({
    required super.airDate,
    required super.episodeCount,
    required super.id,
    required super.name,
    required super.overview,
   super.posterPath,
    required super.seasonNumber,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      airDate: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
    );
  }
}

class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel({
    required super.englishName,
    required super.iso_639_1,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'],
      iso_639_1: json['iso_639_1'],
      name: json['name'],
    );
  }
}

class LastEpisodeToAirModel extends LastEpisodeToAir {
  LastEpisodeToAirModel({
    required super.airDate,
    required super.episodeNumber,
    required super.id,
    required super.name,
    required super.overview,
    required super.productionCode,
    required super.seasonNumber,
    required super.voteAverage,
    required super.voteCount,
    super.stillPath,
  });

  factory LastEpisodeToAirModel.fromJson(Map<String, dynamic> json) {
    return LastEpisodeToAirModel(
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      productionCode: json['production_code'],
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
