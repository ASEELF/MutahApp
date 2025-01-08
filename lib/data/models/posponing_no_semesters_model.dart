class PostponingModel {
  final bool eligible;
  final List<int> availableSemesters;

  PostponingModel({required this.eligible, required this.availableSemesters});

  factory PostponingModel.fromJson(Map<String, dynamic> json) {
    return PostponingModel(
      eligible: json['data']['isAllowedToPostpone']['eligible'],
      availableSemesters: List<int>.from(json['data']['isAllowedToPostpone']['availableSemesters']),
    );
  }
}
