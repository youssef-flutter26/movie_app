class LegalPolicyModel {
  final String title;
  final String content;

  LegalPolicyModel({required this.title, required this.content});

  factory LegalPolicyModel.fromJson(Map<String, dynamic> json) {
    return LegalPolicyModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
