import 'package:dartz/dartz.dart';
import 'package:tmdb_clean_architecture/core/error/exceptions.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/people/data/datasources/remote_datasource.dart';
import 'package:tmdb_clean_architecture/features/people/domain/entities/people.dart';
import 'package:tmdb_clean_architecture/features/people/domain/repository/people_repository.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final _remoteDatasource = PeopleRemoteDatasourceImpl();

  @override
  Future<Either<Failure, People>> getPeople(int? page) async {
    try {
      final result = await _remoteDatasource.getPopularPeople(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
