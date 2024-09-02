// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_app/src/data/models/OSM_model/feature_model/properties_model/address_model/address_model.dart';

part 'properties_model.freezed.dart';
part 'properties_model.g.dart';

@freezed
class PropertiesModel with _$PropertiesModel {
  const factory PropertiesModel({
    required int? place_id,
    required String? osm_type,
    required int? osm_id,
    required int? place_rank,
    required String? category,
    required String? type,
    required double? importance,
    required String? addresstype,
    required String? name,
    required String? display_name,
    required Address? address,
  }) = _PropertiesModel;

  factory PropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$PropertiesModelFromJson(json);
}
