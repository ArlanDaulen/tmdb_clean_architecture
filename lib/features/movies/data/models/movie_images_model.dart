import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';

class ImagesModel extends Images {
  ImagesModel({
    required super.id,
    required super.backdrops,
    required super.posters,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    final backdrops = <BackdropsAndPosters>[];
    json['backdrops']
        .forEach((v) => backdrops.add(BackdropsAndPostersModel.fromJson(v)));
    final posters = <BackdropsAndPostersModel>[];
    json['posters']
        .forEach((v) => posters.add(BackdropsAndPostersModel.fromJson(v)));
    return ImagesModel(
      id: json['id'],
      backdrops: backdrops,
      posters: posters,
    );
  }
}

class BackdropsAndPostersModel extends BackdropsAndPosters {
  BackdropsAndPostersModel({
    required super.aspectRatio,
    required super.filePath,
    required super.height,
    super.iso,
    required super.voteAverage,
    required super.voteCount,
    required super.width,
  });

  factory BackdropsAndPostersModel.fromJson(Map<String, dynamic> json) {
    return BackdropsAndPostersModel(
      aspectRatio: json['aspect_ratio'],
      filePath: json['file_path'],
      height: json['height'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}
