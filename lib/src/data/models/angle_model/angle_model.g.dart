// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'angle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AngleModelImpl _$$AngleModelImplFromJson(Map<String, dynamic> json) =>
    _$AngleModelImpl(
      angle: json['angle'] as String?,
      initialAngle: json['initialAngle'] as String?,
      steps: json['steps'] as String?,
      noOfTurns: (json['noOfTurns'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AngleModelImplToJson(_$AngleModelImpl instance) =>
    <String, dynamic>{
      'angle': instance.angle,
      'initialAngle': instance.initialAngle,
      'steps': instance.steps,
      'noOfTurns': instance.noOfTurns,
    };
