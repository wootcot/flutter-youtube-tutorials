import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
sealed class Env {
  @EnviedField(varName: "AI_API_URL")
  static const String aiApiUrl = _Env.aiApiUrl;

  @EnviedField(varName: "AI_API_KEY")
  static const String aiApiKey = _Env.aiApiKey;

  @EnviedField(varName: "GEMINI_AI_API_KEY")
  static const String geminiApiKey = _Env.geminiApiKey;
}
