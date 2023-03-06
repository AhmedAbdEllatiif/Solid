import 'package:dartz/dartz.dart';
import 'package:solid_test/domain/entities/color_entity.dart';

import '../../data/params/fetch_new_color_params.dart';
import '../entities/app_error.dart';

abstract class RemoteRepository {
  /// return either AppError or ColorEntity
  Future<Either<AppError, ColorEntity>> getNewColor(
    FetchNewColorParams params,
  );
}
