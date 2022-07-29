import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/data/repository/tv_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_event.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final _repository = TvRepositoryImpl();
  
  SeriesBloc(super.initialState) {
    on<LoadPopularSeries>((event, emit) async {
      emit(SeriesLoading());
      final popular = await _repository.getPopularTvs(null);
      popular.fold(
        (l) => emit(SeriesLoadError(message: l.message!)),
        (r) => emit(PopularSeriesLoaded(popular: r)),
      );
    });

    on<LoadTopRatedSeries>((event, emit) async {
      emit(SeriesLoading());
      final topRated = await _repository.getTopRatedTvs(null);
      topRated.fold(
        (l) => emit(SeriesLoadError(message: l.message!)),
        (r) => emit(TopRatedSeriesLoaded(topRated: r)),
      );
    });

    on<LoadAiringTodaySeries>((event, emit) async {
      emit(SeriesLoading());
      final airingToday = await _repository.getAiringTodayTvs(null);
      airingToday.fold(
        (l) => emit(SeriesLoadError(message: l.message!)),
        (r) => emit(AiringTodaySeriesLoaded(airingToday: r)),
      );
    });
  }
}
