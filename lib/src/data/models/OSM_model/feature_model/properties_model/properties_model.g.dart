// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertiesModelImpl _$$PropertiesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertiesModelImpl(
      place_id: (json['place_id'] as num?)?.toInt(),
      osm_type: json['osm_type'] as String?,
      osm_id: (json['osm_id'] as num?)?.toInt(),
      place_rank: (json['place_rank'] as num?)?.toInt(),
      category: json['category'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
      addresstype: json['addresstype'] as String?,
      name: json['name'] as String?,
      display_name: json['display_name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PropertiesModelImplToJson(
        _$PropertiesModelImpl instance) =>
    <String, dynamic>{
      'place_id': instance.place_id,
      'osm_type': instance.osm_type,
      'osm_id': instance.osm_id,
      'place_rank': instance.place_rank,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
      'addresstype': instance.addresstype,
      'name': instance.name,
      'display_name': instance.display_name,
      'address': instance.address,
    };
