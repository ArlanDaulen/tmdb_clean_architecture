import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb_clean_architecture/features/people/data/datasources/remote_datasource.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/bloc/people_bloc/people_event.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PeopleBloc>().add(LoadPeople());
    return Scaffold(
      body: Center(
        child: Text('Popular people Page'),
      ),
    );
  }
}
