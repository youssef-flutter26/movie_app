import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:movie_app/constant.dart';

class AiApiService {
  late final GenerativeModel _model;

  AiApiService([dynamic _]) {
    _model = GenerativeModel(
      model: 'gemini-3.6-flash', // الموديل المتاح في القائمة عندك
      apiKey: aiAPiKey,
    );
  }

  Future<String?> fetchAiResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text;
    } catch (e) {
      print('Gemini SDK Error: $e');
      rethrow;
    }
  }
}
