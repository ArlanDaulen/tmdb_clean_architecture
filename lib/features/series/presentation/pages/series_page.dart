import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/shared/widgets/expandable_fab.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_event.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_state.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';
import 'package:tmdb_clean_architecture/shared/widgets/filters.dart';
import 'package:tmdb_clean_architecture/shared/widgets/loading_view.dart';
import 'package:tmdb_clean_architecture/shared/widgets/movies_or_tvs_wrap.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SeriesBloc>().add(LoadPopularSeries());
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        String? title;
        if (state is PopularSeriesLoaded) {
          title = 'Popular series';
        } else if (state is TopRatedSeriesLoaded) {
          title = 'Top Rated series';
        } else {
          title = 'Airing Today series';
        }
        return Scaffold(
          floatingActionButton: ExpandableFab(
            texts: const [
              'Popular',
              'Top Rated',
              'Airing Today'
            ],
            icons: const [
              Icons.timer_sharp,
              Icons.person_add,
              Icons.groups,
            ],
            onTaps: [
              () => context.read<SeriesBloc>().add(LoadAiringTodaySeries()),
              () => context.read<SeriesBloc>().add(LoadTopRatedSeries()),
              () => context.read<SeriesBloc>().add(LoadPopularSeries()),
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
      },
    );
  }

  Widget _returnState(SeriesState state) {
    if (state is PopularSeriesLoaded) {
      return MoviesOrTvWrap(
        series: state.popular.results,
      );
    } else if (state is TopRatedSeriesLoaded) {
      return MoviesOrTvWrap(
        series: state.topRated.results,
      );
    } else if (state is AiringTodaySeriesLoaded) {
      return MoviesOrTvWrap(
        series: state.airingToday.results,
      );
    } else if (state is SeriesLoadError) {
      return DefaultText(state.message);
    } else {
      return const LoadingView();
    }
  }
}
