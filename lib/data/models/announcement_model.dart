class Announcement {
  final String title;
  final String body;

  Announcement({required this.title, required this.body});

  // Factory constructor to create a model from JSON data
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['Title'],
      body: json['Body'],
    );
  }

  // Method to convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Body': body,
    };
  }
}
