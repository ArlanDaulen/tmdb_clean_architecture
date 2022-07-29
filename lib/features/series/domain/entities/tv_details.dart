class TvDetails {
  String? backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  String firstAirDate;
  List<SeriesGenre> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  List<NetworksAndProdCompanies> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  num popularity;
  String? posterPath;
  List<NetworksAndProdCompanies> productionCompanies;
  List<ProductionCountry> productionCountries;
  List<Season> seasons;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  num voteAverage;
  int voteCount;

  TvDetails({
    this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });
}

class CreatedBy {
  int id;
  String creditId;
  String name;
  int gender;
  String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });
}

class SeriesGenre {
  int id;
  String name;
  SeriesGenre({required this.id, required this.name});
}

class LastEpisodeToAir {
  String airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  String? stillPath;
  num voteAverage;
  int voteCount;

  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });
}

class NetworksAndProdCompanies {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  NetworksAndProdCompanies({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });
}

class ProductionCountry {
  String iso_3166_1;
  String name;
  ProductionCountry({required this.iso_3166_1, required this.name});
}

class Season {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String? posterPath;
  int seasonNumber;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    required this.seasonNumber,
  });
}

class SpokenLanguage {
  String englishName;
  String iso_639_1;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });
}
