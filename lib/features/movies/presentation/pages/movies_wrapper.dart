import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/bloc/movies_state.dart';

class MoviesWrapper extends StatelessWidget {
  const MoviesWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
        MoviesBloc(MoviesLoading())
      ,
      child: const AutoRouter(),
    );
  }
}
