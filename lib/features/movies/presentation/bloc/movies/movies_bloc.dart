import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/data/repository/movie_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _repository = MovieRepositoryImpl();

  MoviesBloc(super.initialState) {
    on<LoadPopularMovies>((event, emit) async {
      emit(MoviesLoading());
      final popular = await _repository.getPopularMovies(null);
      popular.fold(
        (l) => emit(MoviesLoadError(message: l.message!)),
        (r) => emit(PopularMoviesLoaded(popular: r)),
      );
    });

    on<LoadTopRatedMovies>((event, emit) async {
      emit(MoviesLoading());
      final topRated = await _repository.getTopRatedMovies(null);
      topRated.fold(
        (l) => emit(MoviesLoadError(message: l.message!)),
        (r) => emit(TopRatedMoviesLoaded(topRated: r)),
      );
    });

    on<LoadUpcomingMovies>((event, emit) async {
      emit(MoviesLoading());
      final upcoming = await _repository.getUpcoming(null);
      upcoming.fold(
        (l) => emit(MoviesLoadError(message: l.message!)),
        (r) => emit(UpcomingMoviesLoaded(upcoming: r)),
      );
    });

    on<LoadNowPlayingMovies>((event, emit) async {
      emit(MoviesLoading());
      final nowPlaying = await _repository.getNowPlayingMovies(null);
      nowPlaying.fold(
        (l) => emit(MoviesLoadError(message: l.message!)),
        (r) => emit(NowPlayingMoviesLoaded(nowPlaying: r)),
      );
    });
  }
}
