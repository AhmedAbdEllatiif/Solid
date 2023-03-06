import 'package:dartz/dartz.dart';
import 'package:solid_test/data/params/fetch_new_color_params.dart';
import 'package:solid_test/domain/entities/color_entity.dart';
import 'package:solid_test/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../repositories/remote_repository.dart';

class GetNewColorCase extends UseCase<ColorEntity, FetchNewColorParams> {
  final RemoteRepository remoteRepository;

  GetNewColorCase({
    required this.remoteRepository,
  });

  @override
  Future<Either<AppError, ColorEntity>> call(
          FetchNewColorParams params) async =>
      await remoteRepository.getNewColor(params);
}
