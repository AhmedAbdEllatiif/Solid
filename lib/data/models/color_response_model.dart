import 'dart:convert';

import 'package:solid_test/common/constants/app_utils.dart';

import '../../domain/entities/color_entity.dart';

/// return [ColorResponseModel] from received json
ColorResponseModel parseColorModelFromBody(String body) {
  // decode the received body
  final json = jsonDecode(body);

  // check json if null
  // helps you to find out the problem
  // send non-fatal issue the firebase crashlytics if app connected with
  if (json == null) {
    throw Exception(
        "ColorResponseModel >> parseColorModelFroJson >> json is null <<");
  }

  return ColorResponseModel.fromJson(json);
}



class ColorResponseModel extends ColorEntity {
  final int code;

  const ColorResponseModel({required this.code})
      : super(
          bgColorCode: code,
        );

  factory ColorResponseModel.fromJson(dynamic json) {
    return ColorResponseModel(
      code: json["colorCode"] ?? AppUtils.undefined,
    );
  }
}
