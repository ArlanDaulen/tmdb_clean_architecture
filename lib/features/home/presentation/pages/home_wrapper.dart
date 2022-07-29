import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/bloc/home_state.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_state.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_state.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(Loading())),
        BlocProvider(
            create: (context) => MovieDetailsBloc(MovieDetailsLoading())),
        BlocProvider(
            create: (context) => SeriesDetailsBloc(SeriesDetailsLoading())),
      ],
      child: const AutoRouter(),
    );
  }
}
