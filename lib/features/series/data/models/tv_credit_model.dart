import 'package:tmdb_clean_architecture/features/series/domain/entities/tv_credit.dart';

class TvCreditModel extends TvCredit {
  TvCreditModel({required super.id, required super.cast, required super.crew});

  factory TvCreditModel.fromJson(Map<String, dynamic> json) {
    final cast = <TvCast>[];
    json['cast'].forEach((v) => cast.add(TvCastModel.fromJson(v)));
    final crew = <TvCrew>[];
    json['crew'].forEach((v) => crew.add(TvCrewModel.fromJson(v)));
    return TvCreditModel(id: json['id'], cast: cast, crew: crew);
  }
}

class TvCastModel extends TvCast {
  TvCastModel({
    required super.adult,
    required super.character,
    required super.creditId,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.order,
    required super.originalName,
    required super.popularity,
    super.gender,
    super.profilePath,
  });

  factory TvCastModel.fromJson(Map<String, dynamic> json) {
    return TvCastModel(
      adult: json['adult'],
      character: json['character'],
      creditId: json['credit_id'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      order: json['order'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      gender: json['gender'],
      profilePath: json['profile_path'],
    );
  }
}

class TvCrewModel extends TvCrew {
  TvCrewModel({
    required super.adult,
    required super.id,
    required super.creditId,
    required super.department,
    required super.job,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.gender,
    super.profilePath,
  });

  factory TvCrewModel.fromJson(Map<String, dynamic> json) {
    return TvCrewModel(
      adult: json['adult'],
      id: json['id'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      gender: json['gender'],
      profilePath: json['profile_path'],
    );
  }
}
