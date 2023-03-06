import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final int bgColorCode;

  const ColorEntity({required this.bgColorCode});

  @override
  List<Object?> get props => [bgColorCode];
}
