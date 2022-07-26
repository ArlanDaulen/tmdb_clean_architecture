import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/data/repository/movie_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final _repository = MovieRepositoryImpl();

  MovieDetailsBloc(super.initialState) {
    on<LoadMovieDetails>((event, emit) async {
      final movieId = event.movieId;
      emit(MovieDetailsLoading());
      final details = await _repository.getMovieDetails(movieId);
      final credits = await _repository.getMovieCredits(movieId);
      final reviews = await _repository.getMovieReviews(movieId);
      final images = await _repository.getMovieImages(movieId);
      final recommendations = await _repository.getRecommendations(movieId);
      final keywords = await _repository.getMovieKeywords(movieId);

      details.fold(
        (l) => emit(MovieDetailsLoadError(message: l.message!)),
        (r) => emit(MovieDetailsLoaded(
          movie: r,
          credits: credits,
          reviews: reviews,
          images: images,
          recommendations: recommendations,
          keywords: keywords,
        )),
      );
    });
  }
}
