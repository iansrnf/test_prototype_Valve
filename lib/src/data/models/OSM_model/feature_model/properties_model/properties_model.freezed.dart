// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertiesModel _$PropertiesModelFromJson(Map<String, dynamic> json) {
  return _PropertiesModel.fromJson(json);
}

/// @nodoc
mixin _$PropertiesModel {
  int? get place_id => throw _privateConstructorUsedError;
  String? get osm_type => throw _privateConstructorUsedError;
  int? get osm_id => throw _privateConstructorUsedError;
  int? get place_rank => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  double? get importance => throw _privateConstructorUsedError;
  String? get addresstype => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get display_name => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesModelCopyWith<PropertiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesModelCopyWith<$Res> {
  factory $PropertiesModelCopyWith(
          PropertiesModel value, $Res Function(PropertiesModel) then) =
      _$PropertiesModelCopyWithImpl<$Res, PropertiesModel>;
  @useResult
  $Res call(
      {int? place_id,
      String? osm_type,
      int? osm_id,
      int? place_rank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      String? display_name,
      Address? address});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$PropertiesModelCopyWithImpl<$Res, $Val extends PropertiesModel>
    implements $PropertiesModelCopyWith<$Res> {
  _$PropertiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place_id = freezed,
    Object? osm_type = freezed,
    Object? osm_id = freezed,
    Object? place_rank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? display_name = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      place_id: freezed == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as int?,
      osm_type: freezed == osm_type
          ? _value.osm_type
          : osm_type // ignore: cast_nullable_to_non_nullable
              as String?,
      osm_id: freezed == osm_id
          ? _value.osm_id
          : osm_id // ignore: cast_nullable_to_non_nullable
              as int?,
      place_rank: freezed == place_rank
          ? _value.place_rank
          : place_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: freezed == addresstype
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      display_name: freezed == display_name
          ? _value.display_name
          : display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertiesModelImplCopyWith<$Res>
    implements $PropertiesModelCopyWith<$Res> {
  factory _$$PropertiesModelImplCopyWith(_$PropertiesModelImpl value,
          $Res Function(_$PropertiesModelImpl) then) =
      __$$PropertiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? place_id,
      String? osm_type,
      int? osm_id,
      int? place_rank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      String? display_name,
      Address? address});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$PropertiesModelImplCopyWithImpl<$Res>
    extends _$PropertiesModelCopyWithImpl<$Res, _$PropertiesModelImpl>
    implements _$$PropertiesModelImplCopyWith<$Res> {
  __$$PropertiesModelImplCopyWithImpl(
      _$PropertiesModelImpl _value, $Res Function(_$PropertiesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place_id = freezed,
    Object? osm_type = freezed,
    Object? osm_id = freezed,
    Object? place_rank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? display_name = freezed,
    Object? address = freezed,
  }) {
    return _then(_$PropertiesModelImpl(
      place_id: freezed == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as int?,
      osm_type: freezed == osm_type
          ? _value.osm_type
          : osm_type // ignore: cast_nullable_to_non_nullable
              as String?,
      osm_id: freezed == osm_id
          ? _value.osm_id
          : osm_id // ignore: cast_nullable_to_non_nullable
              as int?,
      place_rank: freezed == place_rank
          ? _value.place_rank
          : place_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: freezed == addresstype
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      display_name: freezed == display_name
          ? _value.display_name
          : display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertiesModelImpl implements _PropertiesModel {
  const _$PropertiesModelImpl(
      {required this.place_id,
      required this.osm_type,
      required this.osm_id,
      required this.place_rank,
      required this.category,
      required this.type,
      required this.importance,
      required this.addresstype,
      required this.name,
      required this.display_name,
      required this.address});

  factory _$PropertiesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertiesModelImplFromJson(json);

  @override
  final int? place_id;
  @override
  final String? osm_type;
  @override
  final int? osm_id;
  @override
  final int? place_rank;
  @override
  final String? category;
  @override
  final String? type;
  @override
  final double? importance;
  @override
  final String? addresstype;
  @override
  final String? name;
  @override
  final String? display_name;
  @override
  final Address? address;

  @override
  String toString() {
    return 'PropertiesModel(place_id: $place_id, osm_type: $osm_type, osm_id: $osm_id, place_rank: $place_rank, category: $category, type: $type, importance: $importance, addresstype: $addresstype, name: $name, display_name: $display_name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertiesModelImpl &&
            (identical(other.place_id, place_id) ||
                other.place_id == place_id) &&
            (identical(other.osm_type, osm_type) ||
                other.osm_type == osm_type) &&
            (identical(other.osm_id, osm_id) || other.osm_id == osm_id) &&
            (identical(other.place_rank, place_rank) ||
                other.place_rank == place_rank) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.addresstype, addresstype) ||
                other.addresstype == addresstype) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.display_name, display_name) ||
                other.display_name == display_name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      place_id,
      osm_type,
      osm_id,
      place_rank,
      category,
      type,
      importance,
      addresstype,
      name,
      display_name,
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertiesModelImplCopyWith<_$PropertiesModelImpl> get copyWith =>
      __$$PropertiesModelImplCopyWithImpl<_$PropertiesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertiesModelImplToJson(
      this,
    );
  }
}

abstract class _PropertiesModel implements PropertiesModel {
  const factory _PropertiesModel(
      {required final int? place_id,
      required final String? osm_type,
      required final int? osm_id,
      required final int? place_rank,
      required final String? category,
      required final String? type,
      required final double? importance,
      required final String? addresstype,
      required final String? name,
      required final String? display_name,
      required final Address? address}) = _$PropertiesModelImpl;

  factory _PropertiesModel.fromJson(Map<String, dynamic> json) =
      _$PropertiesModelImpl.fromJson;

  @override
  int? get place_id;
  @override
  String? get osm_type;
  @override
  int? get osm_id;
  @override
  int? get place_rank;
  @override
  String? get category;
  @override
  String? get type;
  @override
  double? get importance;
  @override
  String? get addresstype;
  @override
  String? get name;
  @override
  String? get display_name;
  @override
  Address? get address;
  @override
  @JsonKey(ignore: true)
  _$$PropertiesModelImplCopyWith<_$PropertiesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
