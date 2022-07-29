import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_bloc/series_state.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_state.dart';

class SeriesWrapper extends StatelessWidget {
  const SeriesWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SeriesBloc(SeriesLoading()),
        ),
        BlocProvider(
          create: (context) => SeriesDetailsBloc(SeriesDetailsLoading()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
