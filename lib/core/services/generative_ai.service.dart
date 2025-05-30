import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:wootcot_simplified/core/config/env.dart';
import 'package:wootcot_simplified/core/models/training_plan.model.dart';

part 'generative_ai.service.g.dart';

@riverpod
GenerativeAiService generativeAiService(Ref ref) {
  OpenAI.apiKey = Env.aiApiKey;
  OpenAI.baseUrl = Env.aiApiUrl;
  return GenerativeAiService();
}

class GenerativeAiService {
  final model = GenerativeModel(
    apiKey: Env.geminiApiKey,
    model: 'gemini-2.0-flash',
    generationConfig: GenerationConfig(responseMimeType: "application/json"),
  );

  Future<TrainingPlan> generateMock(String userInput) async {
    return TrainingPlan.fromJson({
      "title": "Full Body Workout",
      "date": "2024-01-27",
      "plan": [
        {
          "exercise": "Squats",
          "sets": 3,
          "reps": [15, 12, 10],
          "weight": [70.0, 75.0, 80.0],
        },
        {
          "exercise": "Bench Press",
          "sets": 3,
          "reps": [15, 12, 10],
          "weight": [60.5, 65.0, 70.0],
        },
        {
          "exercise": "Barbell Rows",
          "sets": 3,
          "reps": [12, 10, 8],
          "weight": [50.0, 55.0, 60.0],
        },
        {
          "exercise": "Overhead Press",
          "sets": 3,
          "reps": [12, 10, 8],
          "weight": [40.0, 45.0, 50.0],
        },
        {
          "exercise": "Deadlifts",
          "sets": 1,
          "reps": [12],
          "weight": [80.0],
        },
      ],
    });
  }

  Future<TrainingPlan> generateWithGemini(String userInput) async {
    final prompt = """
      Convert this into a JSON training plan with training-title.
      
      Format:
      {
        "title": "training-title",
        "date": "YYYY-MM-DD",
        "plan": [
          {"exercise": "exercise-name", "sets": int, "reps": [int, int, ...], "weight": [double, double, ...]}
        ],
      }

      Example:
      {
        "title": "Full Body Workout",
        "date": "2023-10-01",
        "plan": [
          {"exercise": "Squats", "sets": 3, "reps": [15, 12, 10], "weight": [70.0, 75.0, 80.0]},
          {"exercise": "Overhead Press", "sets": 3, "reps": [12, 10, 8], "weight": [40.0, 45.0, 50.0]},
          {"exercise": "Deadlifts", "sets": 1, "reps": [12], "weight": [80.0]},
        ],
      }

      You are a personal trainer. Create a training plan based on the user's input.

      User input: "$userInput"
    """;

    final response = await model.generateContent([Content.text(prompt)]);

    final t = response.text;
    if (t == null || t.isEmpty) {
      throw Exception('No response from Gemini model');
    }

    final List<dynamic> jsonList = jsonDecode(t);
    return TrainingPlan.fromJson(jsonList.first);
  }

  Future<TrainingPlan> generate(String userInput) async {
    final systemPrompt = """
      The user will provide a request for a training plan. Your task is to convert this request into a structured JSON format that represents a training plan. The JSON should include the title of the training, the date, and a list of exercises with their respective sets, reps, and weights for each reps.

      EXAMPLE INPUT: 
      full body workout

      EXAMPLE JSON OUTPUT:
      {
        "title": "Full Body Workout",
        "date": "2023-10-01",
        "plan": [
          {"exercise": "Squats", "sets": 3, "reps": [15, 12, 10], "weight": [70.0, 75.0, 80.0]},
          {"exercise": "Overhead Press", "sets": 3, "reps": [12, 10, 8], "weight": [40.0, 45.0, 50.0]},
          {"exercise": "Deadlifts", "sets": 1, "reps": [12], "weight": [80.0]},
        ],
      }
    """;

    // the system message that will be sent to the request.
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.system,
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(systemPrompt),
      ],
    );

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.user,
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(userInput),
      ],
    );

    final requestMessages = [systemMessage, userMessage];
    final response = await OpenAI.instance.chat.create(
      temperature: 0,
      model: "deepseek-chat",
      messages: requestMessages,
      responseFormat: {"type": "json_object"},
    );

    final t = response.choices.first.message.content?.first.text;
    if (t == null || t.isEmpty) {
      throw Exception('No response from model');
    }

    final List<dynamic> jsonList = jsonDecode(t);
    return TrainingPlan.fromJson(jsonList.first);
  }
}
