import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/people/domain/entities/people.dart';

abstract class PeopleRepository {
  Future<Either<Failure, People>> getPeople(int? page);
}