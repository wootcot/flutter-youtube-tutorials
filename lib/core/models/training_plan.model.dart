import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_plan.model.g.dart';
part 'training_plan.model.freezed.dart';

@freezed
sealed class TrainingPlan with _$TrainingPlan {
  const factory TrainingPlan({
    required String title,
    required DateTime date,
    required List<PlanItem> plan,
  }) = _TrainingPlan;

  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);
}

@freezed
sealed class PlanItem with _$PlanItem {
  const factory PlanItem({
    required int sets,
    required int reps,
    required double weight,
    required String exercise,
  }) = _PlanItem;

  factory PlanItem.fromJson(Map<String, dynamic> json) =>
      _$PlanItemFromJson(json);
}
