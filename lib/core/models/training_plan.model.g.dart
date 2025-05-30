// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) =>
    _TrainingPlan(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      plan:
          (json['plan'] as List<dynamic>)
              .map((e) => PlanItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$TrainingPlanToJson(_TrainingPlan instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'plan': instance.plan.map((e) => e.toJson()).toList(),
    };

_PlanItem _$PlanItemFromJson(Map<String, dynamic> json) => _PlanItem(
  sets: (json['sets'] as num).toInt(),
  reps: (json['reps'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  exercise: json['exercise'] as String,
);

Map<String, dynamic> _$PlanItemToJson(_PlanItem instance) => <String, dynamic>{
  'sets': instance.sets,
  'reps': instance.reps,
  'weight': instance.weight,
  'exercise': instance.exercise,
};
