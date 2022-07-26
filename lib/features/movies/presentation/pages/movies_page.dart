import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_event.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_state.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/widgets/movies_list.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/widgets/search.dart';
import 'package:tmdb_clean_architecture/shared/constants/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';


class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(LoadMovies());
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      if (state is MoviesLoaded) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
              // const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTitle(
                    'Popular movies',
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const DefaultText(
                      'all',
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: state.popular.fold(
                  (l) => DefaultText(l.message ?? 'No data'),
                  (r) => MovieList(movies: r.results),
                ),
              ),
              // const SizedBox(height: 10),
              // const DefaultTitle('Top rated movies'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTitle(
                    'Top rated movies',
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const DefaultText(
                      'all',
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: state.topeRated.fold(
                  (l) => DefaultText(l.message ?? 'No data'),
                  (r) => MovieList(movies: r.results),
                ),
              ),
              // const SizedBox(height: 10),
              // const DefaultTitle('Now Playing Movies'),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTitle(
                    'Now Playing Movies',
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const DefaultText(
                      'all',
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: state.nowPlaying.fold(
                  (l) => DefaultText(l.message ?? 'No data'),
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
