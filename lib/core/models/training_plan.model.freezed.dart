// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_plan.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingPlan {

 String get title; DateTime get date; List<PlanItem> get plan;
/// Create a copy of TrainingPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingPlanCopyWith<TrainingPlan> get copyWith => _$TrainingPlanCopyWithImpl<TrainingPlan>(this as TrainingPlan, _$identity);

  /// Serializes this TrainingPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingPlan&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.plan, plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,date,const DeepCollectionEquality().hash(plan));

@override
String toString() {
  return 'TrainingPlan(title: $title, date: $date, plan: $plan)';
}


}

/// @nodoc
abstract mixin class $TrainingPlanCopyWith<$Res>  {
  factory $TrainingPlanCopyWith(TrainingPlan value, $Res Function(TrainingPlan) _then) = _$TrainingPlanCopyWithImpl;
@useResult
$Res call({
 String title, DateTime date, List<PlanItem> plan
});




}
/// @nodoc
class _$TrainingPlanCopyWithImpl<$Res>
    implements $TrainingPlanCopyWith<$Res> {
  _$TrainingPlanCopyWithImpl(this._self, this._then);

  final TrainingPlan _self;
  final $Res Function(TrainingPlan) _then;

/// Create a copy of TrainingPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? date = null,Object? plan = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as List<PlanItem>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TrainingPlan implements TrainingPlan {
  const _TrainingPlan({required this.title, required this.date, required final  List<PlanItem> plan}): _plan = plan;
  factory _TrainingPlan.fromJson(Map<String, dynamic> json) => _$TrainingPlanFromJson(json);

@override final  String title;
@override final  DateTime date;
 final  List<PlanItem> _plan;
@override List<PlanItem> get plan {
  if (_plan is EqualUnmodifiableListView) return _plan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plan);
}


/// Create a copy of TrainingPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingPlanCopyWith<_TrainingPlan> get copyWith => __$TrainingPlanCopyWithImpl<_TrainingPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingPlan&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._plan, _plan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,date,const DeepCollectionEquality().hash(_plan));

@override
String toString() {
  return 'TrainingPlan(title: $title, date: $date, plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$TrainingPlanCopyWith<$Res> implements $TrainingPlanCopyWith<$Res> {
  factory _$TrainingPlanCopyWith(_TrainingPlan value, $Res Function(_TrainingPlan) _then) = __$TrainingPlanCopyWithImpl;
@override @useResult
$Res call({
 String title, DateTime date, List<PlanItem> plan
});




}
/// @nodoc
class __$TrainingPlanCopyWithImpl<$Res>
    implements _$TrainingPlanCopyWith<$Res> {
  __$TrainingPlanCopyWithImpl(this._self, this._then);

  final _TrainingPlan _self;
  final $Res Function(_TrainingPlan) _then;

/// Create a copy of TrainingPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? date = null,Object? plan = null,}) {
  return _then(_TrainingPlan(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self._plan : plan // ignore: cast_nullable_to_non_nullable
as List<PlanItem>,
  ));
}


}


/// @nodoc
mixin _$PlanItem {

 int get sets; List<num> get reps; String get exercise; List<double> get weight;
/// Create a copy of PlanItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanItemCopyWith<PlanItem> get copyWith => _$PlanItemCopyWithImpl<PlanItem>(this as PlanItem, _$identity);

  /// Serializes this PlanItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanItem&&(identical(other.sets, sets) || other.sets == sets)&&const DeepCollectionEquality().equals(other.reps, reps)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other.weight, weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sets,const DeepCollectionEquality().hash(reps),exercise,const DeepCollectionEquality().hash(weight));

@override
String toString() {
  return 'PlanItem(sets: $sets, reps: $reps, exercise: $exercise, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $PlanItemCopyWith<$Res>  {
  factory $PlanItemCopyWith(PlanItem value, $Res Function(PlanItem) _then) = _$PlanItemCopyWithImpl;
@useResult
$Res call({
 int sets, List<num> reps, String exercise, List<double> weight
});




}
/// @nodoc
class _$PlanItemCopyWithImpl<$Res>
    implements $PlanItemCopyWith<$Res> {
  _$PlanItemCopyWithImpl(this._self, this._then);

  final PlanItem _self;
  final $Res Function(PlanItem) _then;

/// Create a copy of PlanItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sets = null,Object? reps = null,Object? exercise = null,Object? weight = null,}) {
  return _then(_self.copyWith(
sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as List<num>,exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlanItem implements PlanItem {
  const _PlanItem({required this.sets, required final  List<num> reps, required this.exercise, required final  List<double> weight}): _reps = reps,_weight = weight;
  factory _PlanItem.fromJson(Map<String, dynamic> json) => _$PlanItemFromJson(json);

@override final  int sets;
 final  List<num> _reps;
@override List<num> get reps {
  if (_reps is EqualUnmodifiableListView) return _reps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reps);
}

@override final  String exercise;
 final  List<double> _weight;
@override List<double> get weight {
  if (_weight is EqualUnmodifiableListView) return _weight;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weight);
}


/// Create a copy of PlanItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanItemCopyWith<_PlanItem> get copyWith => __$PlanItemCopyWithImpl<_PlanItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanItem&&(identical(other.sets, sets) || other.sets == sets)&&const DeepCollectionEquality().equals(other._reps, _reps)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other._weight, _weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sets,const DeepCollectionEquality().hash(_reps),exercise,const DeepCollectionEquality().hash(_weight));

@override
String toString() {
  return 'PlanItem(sets: $sets, reps: $reps, exercise: $exercise, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$PlanItemCopyWith<$Res> implements $PlanItemCopyWith<$Res> {
  factory _$PlanItemCopyWith(_PlanItem value, $Res Function(_PlanItem) _then) = __$PlanItemCopyWithImpl;
@override @useResult
$Res call({
 int sets, List<num> reps, String exercise, List<double> weight
});




}
/// @nodoc
class __$PlanItemCopyWithImpl<$Res>
    implements _$PlanItemCopyWith<$Res> {
  __$PlanItemCopyWithImpl(this._self, this._then);

  final _PlanItem _self;
  final $Res Function(_PlanItem) _then;

/// Create a copy of PlanItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sets = null,Object? reps = null,Object? exercise = null,Object? weight = null,}) {
  return _then(_PlanItem(
sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self._reps : reps // ignore: cast_nullable_to_non_nullable
as List<num>,exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self._weight : weight // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
