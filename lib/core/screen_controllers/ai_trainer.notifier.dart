import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wootcot_simplified/core/models/training_plan.model.dart';
import 'package:wootcot_simplified/core/services/generative_ai.service.dart';

part 'ai_trainer.notifier.g.dart';

@Riverpod(keepAlive: true)
class AiTrainerNotifier extends _$AiTrainerNotifier {
  GenerativeAiService get _aiService => ref.read(generativeAiServiceProvider);

  @override
  FutureOr<TrainingPlan?> build() async {
    // TODO: Load initial data from storage or API if needed.
    return null;
  }

  Future<void> generate(String text) async {
    try {
      state = AsyncLoading<TrainingPlan>();
      final result = await _aiService.generateWithGemini(text);
      state = AsyncData(result);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  String? validateInput(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a valid training plan request.';
    } else if (input.length < 5) {
      return 'Input must be at least 5 characters long.';
    }
    return null;
  }
}
