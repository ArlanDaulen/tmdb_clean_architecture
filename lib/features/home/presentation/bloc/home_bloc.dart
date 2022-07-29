import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/data/repository/home_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_event.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = HomeRepositryimpl();

  HomeBloc(super.initialState) {
    on<Load>((event, emit) async {
      final popularMovies = await _repository.getPopularMovies(null);
      final popularTvs = await _repository.getPopularTvs(null);
      final topRatedMovies = await _repository.getTopRatedMovies(null);
      final topRatedTvs = await _repository.getTopRatedTvs(null);

      emit(Loaded(
        popularMovies: popularMovies,
        popularTvs: popularTvs,
        topRatedMovies: topRatedMovies,
        topRatedTvs: topRatedTvs,
      ));
    });
  }
}

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc(super.initialState) {
    on<ChooseLeft>((event, emit) => emit(LeftToggleChosen()));
    on<ChooseRight>((event, emit) => emit(RightToggleChosen()));
  }
}
