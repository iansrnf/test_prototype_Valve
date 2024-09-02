// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OSMSearchImpl _$$OSMSearchImplFromJson(Map<String, dynamic> json) =>
    _$OSMSearchImpl(
      place_id: (json['place_id'] as num?)?.toInt(),
      licence: json['licence'] as String?,
      osm_type: json['osm_type'] as String?,
      osm_id: (json['osm_id'] as num?)?.toInt(),
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      type: json['type'] as String?,
      place_rank: (json['place_rank'] as num?)?.toInt(),
      importance: (json['importance'] as num?)?.toDouble(),
      addresstype: json['addresstype'] as String?,
      name: json['name'] as String?,
      display_name: json['display_name'] as String?,
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OSMSearchImplToJson(_$OSMSearchImpl instance) =>
    <String, dynamic>{
      'place_id': instance.place_id,
      'licence': instance.licence,
      'osm_type': instance.osm_type,
      'osm_id': instance.osm_id,
      'lat': instance.lat,
      'lon': instance.lon,
      'type': instance.type,
      'place_rank': instance.place_rank,
      'importance': instance.importance,
      'addresstype': instance.addresstype,
      'name': instance.name,
      'display_name': instance.display_name,
      'boundingbox': instance.boundingbox,
    };
