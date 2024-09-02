// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'osm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OSMModel _$OSMModelFromJson(Map<String, dynamic> json) {
  return _OSMModel.fromJson(json);
}

/// @nodoc
mixin _$OSMModel {
  String? get type => throw _privateConstructorUsedError;
  String? get licence => throw _privateConstructorUsedError;
  List<FeatureModel>? get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OSMModelCopyWith<OSMModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OSMModelCopyWith<$Res> {
  factory $OSMModelCopyWith(OSMModel value, $Res Function(OSMModel) then) =
      _$OSMModelCopyWithImpl<$Res, OSMModel>;
  @useResult
  $Res call({String? type, String? licence, List<FeatureModel>? features});
}

/// @nodoc
class _$OSMModelCopyWithImpl<$Res, $Val extends OSMModel>
    implements $OSMModelCopyWith<$Res> {
  _$OSMModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? licence = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      licence: freezed == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OSMModelImplCopyWith<$Res>
    implements $OSMModelCopyWith<$Res> {
  factory _$$OSMModelImplCopyWith(
          _$OSMModelImpl value, $Res Function(_$OSMModelImpl) then) =
      __$$OSMModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? licence, List<FeatureModel>? features});
}

/// @nodoc
class __$$OSMModelImplCopyWithImpl<$Res>
    extends _$OSMModelCopyWithImpl<$Res, _$OSMModelImpl>
    implements _$$OSMModelImplCopyWith<$Res> {
  __$$OSMModelImplCopyWithImpl(
      _$OSMModelImpl _value, $Res Function(_$OSMModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? licence = freezed,
    Object? features = freezed,
  }) {
    return _then(_$OSMModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      licence: freezed == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OSMModelImpl implements _OSMModel {
  const _$OSMModelImpl(
      {required this.type,
      required this.licence,
      required final List<FeatureModel>? features})
      : _features = features;

  factory _$OSMModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OSMModelImplFromJson(json);

  @override
  final String? type;
  @override
  final String? licence;
  final List<FeatureModel>? _features;
  @override
  List<FeatureModel>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OSMModel(type: $type, licence: $licence, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OSMModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.licence, licence) || other.licence == licence) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, licence,
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OSMModelImplCopyWith<_$OSMModelImpl> get copyWith =>
      __$$OSMModelImplCopyWithImpl<_$OSMModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OSMModelImplToJson(
      this,
    );
  }
}

abstract class _OSMModel implements OSMModel {
  const factory _OSMModel(
      {required final String? type,
      required final String? licence,
      required final List<FeatureModel>? features}) = _$OSMModelImpl;

  factory _OSMModel.fromJson(Map<String, dynamic> json) =
      _$OSMModelImpl.fromJson;

  @override
  String? get type;
  @override
  String? get licence;
  @override
  List<FeatureModel>? get features;
  @override
  @JsonKey(ignore: true)
  _$$OSMModelImplCopyWith<_$OSMModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
