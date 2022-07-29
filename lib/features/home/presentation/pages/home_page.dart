import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_event.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_state.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/widgets/search.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/widgets/toggle.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';
import 'package:tmdb_clean_architecture/shared/widgets/gradient_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/loading_view.dart';
import 'package:tmdb_clean_architecture/shared/widgets/movie_or_tv_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(Loading())..add(Load()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Loaded) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.maxFinite,
                    height: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DefaultText(
                          'Welcome',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          size: 20,
                        ),
                        const SizedBox(height: 10),
                        const DefaultText(
                          'Millions of movies, series and people. Explore now.',
                          color: Colors.white,
                          // fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 8),
                        SearchMovie(
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleTvAndMovie(
                    title: "What's popular",
                    movies: state.popularMovies,
                    tvs: state.popularTvs,
                  ),
                  const SizedBox(height: 10),
                  ToggleTvAndMovie(
                    title: 'Top rated',
                    movies: state.topRatedMovies,
                    tvs: state.topRatedTvs,
                  ),
                ],
              ),
            );
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
