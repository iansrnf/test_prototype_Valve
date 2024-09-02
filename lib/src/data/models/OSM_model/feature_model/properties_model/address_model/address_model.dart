import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String? house_number,
    required String? road,
    required String? suburb,
    required String? city,
    required String? county,
    required String? state,
    required String? postcode,
    required String? country,
    required String? countryCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
