class MovieImages {
  int id;
  List<BackdropsAndPosters> backdrops;
  List<BackdropsAndPosters> posters;

  MovieImages({
    required this.id,
    required this.backdrops,
    required this.posters,
  });
}

class BackdropsAndPosters {
  num aspectRatio;
  String filePath;
  int height;
  String? iso;
  int voteAverage;
  int voteCount;
  int width;
  
  BackdropsAndPosters({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    this.iso,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });
}
