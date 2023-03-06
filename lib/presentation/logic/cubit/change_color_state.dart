part of 'change_color_cubit.dart';

abstract class ChangeColorState extends Equatable {
  final Color bgColor;
  final Color textColor;
  final int clickedCount;

  const ChangeColorState({
    this.bgColor = Colors.transparent,
    this.textColor = Colors.black,
    required this.clickedCount,
  });

  @override
  List<Object> get props => [textColor, bgColor, clickedCount];
}

/// initial
class ChangeColorInitial extends ChangeColorState {
  const ChangeColorInitial() : super(bgColor: Colors.white, clickedCount: 0);

  @override
  List<Object> get props => [];
}

/// loading
class LoadingChangeColor extends ChangeColorState {
  const LoadingChangeColor({required super.clickedCount});
}

/// unAuthenticated
class UnAuthenticated extends ChangeColorState {
  const UnAuthenticated({required super.clickedCount});
}

/// success
class ColorChangedSuccessfully extends ChangeColorState {
  final bool reachedNewFive;

  const ColorChangedSuccessfully({
    required this.reachedNewFive,
    required super.textColor,
    required super.bgColor,
    required super.clickedCount,
  });

  @override
  List<Object> get props => [textColor, bgColor, clickedCount, reachedNewFive];
}

/// error
class ErrorWhileChangingColor extends ChangeColorState {
  final AppError appError;

  const ErrorWhileChangingColor(
      {required this.appError, required super.clickedCount});

  @override
  List<Object> get props => [appError];
}
