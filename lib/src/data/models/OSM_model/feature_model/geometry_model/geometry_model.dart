import 'package:freezed_annotation/freezed_annotation.dart';

part 'geometry_model.freezed.dart';
part 'geometry_model.g.dart';

@freezed
class GeometryModel with _$GeometryModel {
  const factory GeometryModel({
    required String? type,
    required List<double>? coordinates,
  }) = _GeometryModel;

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);
}
