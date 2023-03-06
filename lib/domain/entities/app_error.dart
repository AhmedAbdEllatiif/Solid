import 'package:equatable/equatable.dart';

import '../../common/enum/app_error_type.dart';


/// This class represents error according to [AppErrorType] with a message
class AppError extends Equatable {
  final AppErrorType appErrorType;
  final String message;

  const AppError(this.appErrorType, {this.message = ''});

  @override
  List<Object> get props => [appErrorType, message];
}
