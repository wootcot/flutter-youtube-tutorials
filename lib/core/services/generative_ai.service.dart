import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wootcot_simplified/core/models/training_plan.model.dart';

part 'generative_ai.service.g.dart';

@riverpod
GeminiService geminiService(Ref ref) {
  return GeminiService();
}

class GeminiService {
  Future<TrainingPlan> generateResponse(String userInput) async {
    return TrainingPlan.fromJson({
      "title": "Full Body Workout",
      "date": "2024-01-27",
      "plan": [
        {"exercise": "Squats", "sets": 3, "reps": 10, "weight": 70.0},
        {"exercise": "Bench Press", "sets": 3, "reps": 8, "weight": 60.5},
        {"exercise": "Barbell Rows", "sets": 3, "reps": 8, "weight": 50.0},
        {"exercise": "Overhead Press", "sets": 3, "reps": 8, "weight": 40.0},
        {"exercise": "Deadlifts", "sets": 1, "reps": 5, "weight": 80.0},
      ],
    });
  }
}
