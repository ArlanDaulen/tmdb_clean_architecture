import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_state.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/widgets/movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(LoadMovies());
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      if (state is MoviesLoaded) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Popular movies'),
              SizedBox(
                height: 300,
                child: state.popular.fold(
                  (l) => Text(l.message ?? 'No data'),
                  (r) => MovieList(movies: r.results),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Top rated movies'),
              SizedBox(
                height: 300,
                child: state.topeRated.fold(
                  (l) => Text(l.message ?? 'No data'),
                  (r) => MovieList(movies: r.results),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Now Playing Movies'),
              SizedBox(
                height: 300,
                child: state.nowPlaying.fold(
                  (l) => Text(l.message ?? 'No data'),
                  (r) => MovieList(movies: r.results),
                ),
              ),
            ],
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
