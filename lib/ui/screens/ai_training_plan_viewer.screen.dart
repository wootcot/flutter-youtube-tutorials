import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wootcot_simplified/ui/widgets/ai_trainer/training_plan_list.dart';
import 'package:wootcot_simplified/core/screen_controllers/ai_trainer.notifier.dart';

class AiTrainingPlanViewer extends ConsumerWidget {
  const AiTrainingPlanViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(aiTrainerNotifierProvider);
    final t = state.value;
    final tt = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AI Trainer",
          style: tt.titleLarge?.copyWith(
            letterSpacing: 0.5,
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(color: theme.primaryColor),
      ),
      body:
          state.isLoading
              ? Center(child: CircularProgressIndicator())
              : state.hasError
              ? Center(
                child: Text(
                  state.error.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              )
              : TrainingPlanList(trainingPlan: t, onSelect: (plan) {}),
    );
  }
}
