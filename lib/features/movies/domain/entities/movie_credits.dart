class MovieCredits {
  int id;
  List<MovieCast> cast;
  List<MovieCrew> crew;

  MovieCredits({required this.id, required this.cast, required this.crew});

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    final cast = <MovieCast>[];
    json['cast'].forEach((v) => cast.add(MovieCast.fromJson(v)));
    final crew = <MovieCrew>[];
    json['crew'].forEach((v) => crew.add(MovieCrew.fromJson(v)));
    return MovieCredits(id: json['id'], cast: cast, crew: crew);
  }
}

class MovieCast extends MovieCastCrew {
  int castId;
  String character;
  String creditId;
  int order;
  MovieCast({
    required super.adult,
    super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

class MovieCrew extends MovieCastCrew {
  String creditId;
  String department;
  String job;
  MovieCrew({
    required super.adult,
    super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory MovieCrew.fromJson(Map<String, dynamic> json) {
    return MovieCrew(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}

class MovieCastCrew {
  bool adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  num popularity;
  String? profilePath;
  MovieCastCrew({
    required this.adult,
    this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}
