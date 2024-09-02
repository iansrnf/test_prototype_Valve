// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      house_number: json['house_number'] as String?,
      road: json['road'] as String?,
      suburb: json['suburb'] as String?,
      city: json['city'] as String?,
      county: json['county'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'house_number': instance.house_number,
      'road': instance.road,
      'suburb': instance.suburb,
      'city': instance.city,
      'county': instance.county,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'countryCode': instance.countryCode,
    };
