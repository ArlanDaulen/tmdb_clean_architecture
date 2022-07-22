import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/data/repository/movie_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _repository = MovieRepositoryImpl();

  MoviesBloc(super.initialState) {
    on<LoadMovies>((event, emit) async {
      emit(MoviesLoading());
      final popular = await _repository.getPopularMovies(null);
      final topRated = await _repository.getTopRatedMovies(null);
      final nowPlaying = await _repository.getNowPlayingMovies(null);

      emit(MoviesLoaded(
        popular: popular,
        nowPlaying: nowPlaying,
        topeRated: topRated,
      ));
    });
  }
}
