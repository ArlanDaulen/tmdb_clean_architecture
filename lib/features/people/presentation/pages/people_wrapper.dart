import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_bloc.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_state.dart';

class PeopleWrapper extends StatelessWidget {
  const PeopleWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PeopleBloc(PeopleLoading())),
        
      ],
      child: const AutoRouter(),
    );
  }
}
