import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_app/src/data/models/OSM_model/feature_model/feature_model.dart';

part 'osm_model.freezed.dart';
part 'osm_model.g.dart';

@freezed
class OSMModel with _$OSMModel {
  const factory OSMModel({
    required String? type,
    required String? licence,
    required List<FeatureModel>? features,
  }) = _OSMModel;

  factory OSMModel.fromJson(Map<String, dynamic> json) =>
      _$OSMModelFromJson(json);
}
