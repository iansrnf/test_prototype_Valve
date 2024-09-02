import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_app/src/data/models/OSM_model/feature_model/geometry_model/geometry_model.dart';
import 'package:map_app/src/data/models/OSM_model/feature_model/properties_model/properties_model.dart';

part 'feature_model.freezed.dart';
part 'feature_model.g.dart';

@freezed
class FeatureModel with _$FeatureModel {
  const factory FeatureModel({
    required String? type,
    required PropertiesModel? properties,
    required List<double>? bbox,
    required GeometryModel? geometry,
  }) = _FeatureModel;

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}
