import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_event.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_state.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';
import 'package:tmdb_clean_architecture/shared/widgets/gradient_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/movie_or_tv_listview.dart';

class ToggleTvAndMovie extends StatelessWidget {
  const ToggleTvAndMovie({
    Key? key,
    required this.title,
    required this.movies,
    required this.tvs,
  }) : super(key: key);

  final String title;
  final Either<Failure, Movie> movies;
  final Either<Failure, Tv> tvs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleBloc(LeftToggleChosen()),
      child: BlocBuilder<ToggleBloc, ToggleState>(
        builder: (context, toggleState) => Column(
          children: [
            Row(
              children: [
                DefaultTitle(title),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.read<ToggleBloc>().add(ChooseLeft()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (toggleState is LeftToggleChosen)
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          child: GradientText(
                            'On TV',
                            gradient: LinearGradient(
                                colors: toggleState is LeftToggleChosen
                                    ? [
                                        const Color.fromRGBO(175, 254, 194, 1),
                                        const Color.fromRGBO(43, 209, 153, 1)
                                      ]
                                    : [AppColors.black, AppColors.black]),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.read<ToggleBloc>().add(ChooseRight()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (toggleState is RightToggleChosen)
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          child: GradientText(
                            'In Theaters',
                            gradient: LinearGradient(
                                colors: toggleState is RightToggleChosen
                                    ? [
                                        const Color.fromRGBO(175, 254, 194, 1),
                                        const Color.fromRGBO(43, 209, 153, 1)
                                      ]
                                    : [AppColors.black, AppColors.black]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            toggleState is LeftToggleChosen
                ? _buildList(tvs, false)
                : _buildList(movies, true),
          ],
        ),
      ),
    );
  }

  _buildList(dynamic state, bool isMovie) {
    return state.fold(
        (l) => DefaultText(l.message!),
        (r) => SizedBox(
              height: 280,
              child: MovieOrTvListView(
                isMovie: isMovie,
                tvs: isMovie ? null : r.results,
                movies: isMovie ? r.results : null,
                isReplace: false,
              ),
            ));
  }
}
