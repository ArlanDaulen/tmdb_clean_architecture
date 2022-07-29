class TvCredit {
  int id;
  List<TvCast> cast;
  List<TvCrew> crew;

  TvCredit({required this.id, required this.cast, required this.crew});
}

class TvCast {
  bool adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  num popularity;
  String? profilePath;
  String character;
  String creditId;
  int order;

  TvCast({
    required this.adult,
    this.gender,
    required this.character,
    required this.creditId,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.order,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}

class TvCrew {
  bool adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  num popularity;
  String? profilePath;
  String creditId;
  String department;
  String job;

  TvCrew({
    required this.adult,
    this.gender,
    required this.id,
    required this.creditId,
    required this.department,
    required this.job,
    required this.knownForDepartment,
    this.profilePath,
    required this.name,
    required this.originalName,
    required this.popularity,
  });
}
