// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'angle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AngleModel _$AngleModelFromJson(Map<String, dynamic> json) {
  return _AngleModel.fromJson(json);
}

/// @nodoc
mixin _$AngleModel {
  String? get angle => throw _privateConstructorUsedError;
  String? get initialAngle => throw _privateConstructorUsedError;
  String? get steps => throw _privateConstructorUsedError;
  double? get noOfTurns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AngleModelCopyWith<AngleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AngleModelCopyWith<$Res> {
  factory $AngleModelCopyWith(
          AngleModel value, $Res Function(AngleModel) then) =
      _$AngleModelCopyWithImpl<$Res, AngleModel>;
  @useResult
  $Res call(
      {String? angle, String? initialAngle, String? steps, double? noOfTurns});
}

/// @nodoc
class _$AngleModelCopyWithImpl<$Res, $Val extends AngleModel>
    implements $AngleModelCopyWith<$Res> {
  _$AngleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = freezed,
    Object? initialAngle = freezed,
    Object? steps = freezed,
    Object? noOfTurns = freezed,
  }) {
    return _then(_value.copyWith(
      angle: freezed == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as String?,
      initialAngle: freezed == initialAngle
          ? _value.initialAngle
          : initialAngle // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfTurns: freezed == noOfTurns
          ? _value.noOfTurns
          : noOfTurns // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AngleModelImplCopyWith<$Res>
    implements $AngleModelCopyWith<$Res> {
  factory _$$AngleModelImplCopyWith(
          _$AngleModelImpl value, $Res Function(_$AngleModelImpl) then) =
      __$$AngleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? angle, String? initialAngle, String? steps, double? noOfTurns});
}

/// @nodoc
class __$$AngleModelImplCopyWithImpl<$Res>
    extends _$AngleModelCopyWithImpl<$Res, _$AngleModelImpl>
    implements _$$AngleModelImplCopyWith<$Res> {
  __$$AngleModelImplCopyWithImpl(
      _$AngleModelImpl _value, $Res Function(_$AngleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = freezed,
    Object? initialAngle = freezed,
    Object? steps = freezed,
    Object? noOfTurns = freezed,
  }) {
    return _then(_$AngleModelImpl(
      angle: freezed == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as String?,
      initialAngle: freezed == initialAngle
          ? _value.initialAngle
          : initialAngle // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfTurns: freezed == noOfTurns
          ? _value.noOfTurns
          : noOfTurns // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AngleModelImpl implements _AngleModel {
  const _$AngleModelImpl(
      {required this.angle,
      required this.initialAngle,
      required this.steps,
      required this.noOfTurns});

  factory _$AngleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AngleModelImplFromJson(json);

  @override
  final String? angle;
  @override
  final String? initialAngle;
  @override
  final String? steps;
  @override
  final double? noOfTurns;

  @override
  String toString() {
    return 'AngleModel(angle: $angle, initialAngle: $initialAngle, steps: $steps, noOfTurns: $noOfTurns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AngleModelImpl &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.initialAngle, initialAngle) ||
                other.initialAngle == initialAngle) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.noOfTurns, noOfTurns) ||
                other.noOfTurns == noOfTurns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, angle, initialAngle, steps, noOfTurns);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AngleModelImplCopyWith<_$AngleModelImpl> get copyWith =>
      __$$AngleModelImplCopyWithImpl<_$AngleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AngleModelImplToJson(
      this,
    );
  }
}

abstract class _AngleModel implements AngleModel {
  const factory _AngleModel(
      {required final String? angle,
      required final String? initialAngle,
      required final String? steps,
      required final double? noOfTurns}) = _$AngleModelImpl;

  factory _AngleModel.fromJson(Map<String, dynamic> json) =
      _$AngleModelImpl.fromJson;

  @override
  String? get angle;
  @override
  String? get initialAngle;
  @override
  String? get steps;
  @override
  double? get noOfTurns;
  @override
  @JsonKey(ignore: true)
  _$$AngleModelImplCopyWith<_$AngleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
