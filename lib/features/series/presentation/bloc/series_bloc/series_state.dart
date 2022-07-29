import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';

abstract class SeriesState {}

class SeriesLoading extends SeriesState {}

class PopularSeriesLoaded extends SeriesState {
  final Tv popular;
  PopularSeriesLoaded({required this.popular});
}

class TopRatedSeriesLoaded extends SeriesState {
  final Tv topRated;
  TopRatedSeriesLoaded({required this.topRated});
}

class AiringTodaySeriesLoaded extends SeriesState {
  final Tv airingToday;
  AiringTodaySeriesLoaded({required this.airingToday});
}

class SeriesLoadError extends SeriesState {
  final String message;
  SeriesLoadError({required this.message});
}
