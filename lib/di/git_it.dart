import 'package:get_it/get_it.dart';
import 'package:solid_test/data/data_source/remote_data_source.dart';
import 'package:solid_test/domain/repositories/remote_repository.dart';
import 'package:solid_test/domain/usecases/get_new_color_case.dart';
import 'package:solid_test/presentation/logic/cubit/change_color_cubit.dart';

import '../data/api/api_client.dart';
import '../data/repositories/remote_repository_impl.dart';
import '../data/server_simulator/server_simulator.dart';

final getItInstance = GetIt.I;

Future init() async {
  /// Server
  getItInstance.registerFactory<ServerSimulator>(
    () => ServerSimulator(),
  );

  /// ApiClient
  getItInstance.registerFactory<ApiClient>(
    () => ApiClient(server: getItInstance()),
  );

  /// RemoteDataSource
  getItInstance.registerFactory<RemoteDataSource>(
    () => RemoteDataSourceImpl(apiClient: getItInstance()),
  );

  /// RemoteRepository
  getItInstance.registerFactory<RemoteRepository>(
    () => RemoteRepositoryImpl(dataSource: getItInstance()),
  );

  /// GetNewColorCase
  getItInstance.registerFactory<GetNewColorCase>(
    () => GetNewColorCase(remoteRepository: getItInstance()),
  );

  /// ChangeColorCubit
  getItInstance.registerFactory<ChangeColorCubit>(
    () => ChangeColorCubit(),
  );
}
