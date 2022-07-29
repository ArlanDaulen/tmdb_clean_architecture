import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/series/data/repository/tv_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_event.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  final _repository = TvRepositoryImpl();

  SeriesDetailsBloc(super.initialState) {
    on<LoadSeriesDetails>((event, emit) async {
      emit(SeriesDetailsLoading());
      final details = await _repository.getTvDetails(event.tvId);
      final keywords = await _repository.getKeywords(event.tvId);
      final credits = await _repository.getTvCredits(event.tvId);
      final reviews = await _repository.getReviews(event.tvId);
      final images = await _repository.getImages(event.tvId);
      final recommendations = await _repository.getRecommendations(event.tvId);
      details.fold(
        (l) => emit(SeriesDetailsLoadError(message: l.message!)),
        (r) => emit(SeriesDetailsLoaded(
          details: r,
          keywords: keywords,
          credits: credits,
          reviews: reviews,
          images: images,
          recommendations: recommendations,
        )),
      );
    });
  }
}
