class ActorModel {
  final int id;
  final String name;
  final String? profilePath;

  ActorModel({required this.id, required this.name, this.profilePath});

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'] ?? '',
      profilePath: json['profile_path'],
    );
  }
}
