class MovieOrTvKeywords {
  int id;
  List<Keywords> keywords;

  MovieOrTvKeywords({required this.id, required this.keywords});
}

class Keywords {
  int id;
  String name;

  Keywords({required this.id, required this.name});
}
