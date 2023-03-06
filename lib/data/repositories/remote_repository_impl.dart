import 'package:dartz/dartz.dart';
import 'package:solid_test/common/enum/app_error_type.dart';
import 'package:solid_test/data/data_source/remote_data_source.dart';
import 'package:solid_test/data/params/fetch_new_color_params.dart';
import 'package:solid_test/domain/entities/app_error.dart';
import 'package:solid_test/domain/entities/color_entity.dart';
import 'package:solid_test/domain/repositories/remote_repository.dart';

class RemoteRepositoryImpl extends RemoteRepository {
  final RemoteDataSource dataSource;

  RemoteRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppError, ColorEntity>> getNewColor(
      FetchNewColorParams params) async {
    try {
      final result = await dataSource.fetchNewColor(params);
      return result is ColorEntity ? Right(result) : Left(result);
    } catch (e) {
      return Left(AppError(AppErrorType.unDefined, message: "$e"));
    }
  }
}
