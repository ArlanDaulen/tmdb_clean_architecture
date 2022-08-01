import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/people/data/repository/people_repository_impl.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_event.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_state.dart';
import 'dart:developer';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  final _repository = PeopleRepositoryImpl();

  PeopleBloc(super.initialState) {
    on<LoadPeople>((event, emit) async {
      emit(PeopleLoading());
      final people = await _repository.getPeople(null);
      people.fold(
          (l) => log(l.message.toString()),
          (r) => log(r.results.last.knownFor
              .fold((l) => l.last.releaseDate, (r) => r.last.firstAirDate)));
    });
  }
}
