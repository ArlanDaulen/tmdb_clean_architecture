import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_state.dart';
import 'package:tmdb_clean_architecture/shared/widgets/expandable_fab.dart';
import 'package:tmdb_clean_architecture/shared/widgets/filters.dart';
import 'package:tmdb_clean_architecture/shared/widgets/movies_or_tvs_wrap.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';
import 'package:tmdb_clean_architecture/shared/widgets/loading_view.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(LoadPopularMovies());
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      String? title;
      if (state is PopularMoviesLoaded) {
        title = 'Popular movies';
      } else if (state is TopRatedMoviesLoaded) {
        title = 'Top Rated movies';
      } else if (state is UpcomingMoviesLoaded) {
        title = 'Upcoming movies';
      } else {
        title = 'Now Playing movies';
      }
      return Scaffold(
        floatingActionButton: ExpandableFab(
          icons: const [
            Icons.av_timer,
            Icons.timer_sharp,
            Icons.person_add,
            Icons.groups,
          ],
          texts: const [
            'Upcoming',
            'Now playing',
            'Top rated',
            'Popular',
          ],
          onTaps: [
            () => context.read<MoviesBloc>().add(LoadUpcomingMovies()),
            () => context.read<MoviesBloc>().add(LoadNowPlayingMovies()),
            () => context.read<MoviesBloc>().add(LoadTopRatedMovies()),
            () => context.read<MoviesBloc>().add(LoadPopularMovies()),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              DefaultTitle(
                title,
                fontWeight: FontWeight.bold,
                size: 18,
              ),
              Filters(
                onSortTapped: () => log('Sort'),
                onFiltersTapped: () => log('Filters'),
                onWhereToWatchTapped: () => log('Where To Watch'),
              ),
              _returnState(state),
            ],
          ),
        ),
      );
    });
  }

  Widget _returnState(MoviesState state) {
    if (state is PopularMoviesLoaded) {
      return MoviesOrTvWrap(movies: state.popular.results);
    } else if (state is TopRatedMoviesLoaded) {
      return MoviesOrTvWrap(movies: state.topRated.results);
    } else if (state is UpcomingMoviesLoaded) {
      return MoviesOrTvWrap(movies: state.upcoming.results);
    } else if (state is NowPlayingMoviesLoaded) {
      return MoviesOrTvWrap(movies: state.nowPlaying.results);
    } else if (state is MoviesLoadError) {
      return DefaultText(state.message);
    } else {
      return const LoadingView();
    }
  }
}
