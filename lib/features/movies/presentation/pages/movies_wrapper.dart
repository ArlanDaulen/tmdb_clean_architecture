import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movie_details.dart/movie_details_state.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies/movies_state.dart';

class MoviesWrapper extends StatelessWidget {
  const MoviesWrapper({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesBloc(MoviesLoading())),
        BlocProvider(
            create: (context) => MovieDetailsBloc(MovieDetailsLoading())),
      ],
      child: const AutoRouter(),
    );
  }
}