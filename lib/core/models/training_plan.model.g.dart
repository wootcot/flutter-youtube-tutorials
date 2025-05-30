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
  reps: (json['reps'] as List<dynamic>).map((e) => e as num).toList(),
  exercise: json['exercise'] as String,
  weight:
      (json['weight'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
);

Map<String, dynamic> _$PlanItemToJson(_PlanItem instance) => <String, dynamic>{
  'sets': instance.sets,
  'reps': instance.reps,
  'exercise': instance.exercise,
  'weight': instance.weight,
};
