import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solid_test/common/enum/app_error_type.dart';
import 'package:solid_test/data/params/fetch_new_color_params.dart';
import 'package:solid_test/di/git_it.dart';
import 'package:solid_test/domain/entities/app_error.dart';
import 'package:solid_test/domain/entities/color_entity.dart';
import 'package:solid_test/domain/usecases/get_new_color_case.dart';

part 'change_color_state.dart';

class ChangeColorCubit extends Cubit<ChangeColorState> {
  ChangeColorCubit() : super(const ChangeColorInitial());

  void tryToChangeColor({required String accessToken}) async {
    // emit loading
    _emitIfNotClosed(LoadingChangeColor(
      clickedCount: state.clickedCount,
    ));

    // init params
    final params = FetchNewColorParams(accessToken: accessToken);

    // init usecase
    final usecase = getItInstance<GetNewColorCase>();

    // send request
    final either = await usecase(params);

    // response
    either.fold(
      ///==> error
      (appError) {
        _emitIfNotClosed(ErrorWhileChangingColor(
            appError: appError, clickedCount: state.clickedCount + 1));
      },

      ///==> success
      (colorEntity) {
        // init background color
        final bgColor = _generateBgColor(colorEntity);

        // init text color
        final textColor = _generateTextColor(colorEntity);

        // true if  bgColor and textColor are not null
        final colorsGeneratedSuccessfully = isGeneratedColorsNotNull(
          bgColor: bgColor,
          textColor: textColor,
        );

        if (colorsGeneratedSuccessfully) {
          _emitIfNotClosed(ColorChangedSuccessfully(
              bgColor: bgColor!,
              textColor: textColor!,
              reachedNewFive: _isCountReachedNewFive(state.clickedCount),
              clickedCount: state.clickedCount + 1));
        } else {
          _emitIfNotClosed(ErrorWhileChangingColor(
            appError: const AppError(
              AppErrorType.cannotGenerateNewColorFromColorEntity,
            ),
            clickedCount: state.clickedCount + 1,
          ));
        }
      },
    );
  }

  /// return true if textColor and bgColor not null
  bool isGeneratedColorsNotNull({
    required Color? bgColor,
    required Color? textColor,
  }) {
    return bgColor != null && textColor != null;
  }

  /// return true if the counter reached new five
  bool _isCountReachedNewFive(int currentCount) {
    int countToEmit = currentCount + 1;
    bool currentCountNotZero = currentCount != 0;
    bool countToEmitReachFive = countToEmit % 5 == 0;

    return countToEmitReachFive && currentCountNotZero;
  }

  /// to generate a new color from [ColorEntity]
  Color? _generateBgColor(ColorEntity colorEntity) {
    try {
      return Color(colorEntity.bgColorCode);
    } catch (e) {
      return null;
    }
  }

  /// to generate text color
  Color? _generateTextColor(ColorEntity colorEntity) {
    try {
      final bgColor = Color(colorEntity.bgColorCode);
      final blue = bgColor.blue;
      final red = bgColor.red;
      final green = bgColor.green;
      final brightness = red * 0.299 + green * 0.587 + blue * 0.114;
      return brightness > 100 ? Colors.black : Colors.white;
    } catch (e) {
      return null;
    }
  }

  /// to emit new state if not closed
  void _emitIfNotClosed(ChangeColorState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
