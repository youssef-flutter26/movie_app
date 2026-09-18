class GeminiRequestModel {
  final List<ContentModel> contents;
  final GenerationConfigModel? generationConfig;
  final List<ToolModel>? tools;

  GeminiRequestModel({
    required this.contents,
    this.generationConfig,
    this.tools,
  });

  Map<String, dynamic> toJson() {
    return {
      'contents': contents.map((e) => e.toJson()).toList(),
      if (generationConfig != null)
        'generationConfig': generationConfig!.toJson(),
      if (tools != null) 'tools': tools!.map((e) => e.toJson()).toList(),
    };
  }
}

class ContentModel {
  final String role;
  final List<PartModel> parts;

  ContentModel({this.role = 'user', required this.parts});

  Map<String, dynamic> toJson() {
    return {'role': role, 'parts': parts.map((e) => e.toJson()).toList()};
  }
}

class PartModel {
  final String text;

  PartModel({required this.text});

  Map<String, dynamic> toJson() {
    return {'text': text};
  }
}

class GenerationConfigModel {
  final ThinkingConfigModel? thinkingConfig;

  GenerationConfigModel({this.thinkingConfig});

  Map<String, dynamic> toJson() {
    return {
      if (thinkingConfig != null) 'thinkingConfig': thinkingConfig!.toJson(),
    };
  }
}

class ThinkingConfigModel {
  final String thinkingLevel;

  ThinkingConfigModel({this.thinkingLevel = 'MINIMAL'});

  Map<String, dynamic> toJson() {
    return {'thinkingLevel': thinkingLevel};
  }
}

class ToolModel {
  final Map<String, dynamic>? googleSearch;

  ToolModel({this.googleSearch});

  Map<String, dynamic> toJson() {
    return {'googleSearch': googleSearch ?? {}};
  }
}
