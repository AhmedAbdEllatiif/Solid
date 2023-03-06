import 'package:solid_test/common/enum/app_error_type.dart';
import 'package:solid_test/data/api/api_client.dart';
import 'package:solid_test/data/params/fetch_new_color_params.dart';
import 'package:solid_test/domain/entities/app_error.dart';

import '../models/color_response_model.dart';

abstract class RemoteDataSource {
  /// to fetch a new color from server
  Future<dynamic> fetchNewColor(FetchNewColorParams params);
}


/// Implementation on [RemoteDataSource]
class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSourceImpl({required this.apiClient});

  /// to fetch a new color from server
  @override
  Future<dynamic> fetchNewColor(FetchNewColorParams params) async {
    try {
      //==> fetch from server
      final body = await apiClient.getNewColor();

      //==> parse fetched body
      final ColorResponseModel colorModel = parseColorModelFromBody(body);

      return colorModel;
    } catch (e) {
      return AppError(AppErrorType.api, message: "Message: $e");
    }
  }
}
