// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'osm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OSMModelImpl _$$OSMModelImplFromJson(Map<String, dynamic> json) =>
    _$OSMModelImpl(
      type: json['type'] as String?,
      licence: json['licence'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OSMModelImplToJson(_$OSMModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'licence': instance.licence,
      'features': instance.features,
    };
