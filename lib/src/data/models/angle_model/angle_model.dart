import 'package:freezed_annotation/freezed_annotation.dart';

part 'angle_model.freezed.dart';
part 'angle_model.g.dart';

@freezed
class AngleModel with _$AngleModel {
  const factory AngleModel(
      {required String? angle,
      required String? initialAngle,
      required String? steps,
      required double? noOfTurns}) = _AngleModel;

  factory AngleModel.fromJson(Map<String, dynamic> json) =>
      _$AngleModelFromJson(json);
}
