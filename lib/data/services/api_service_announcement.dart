import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mutahapplication/data/models/announcement_model.dart';

class ApiService {
  final String baseUrl = "https://gradprojectbackend-production.up.railway.app";

  Future<List<Announcement>> fetchAnnouncements(String category) async {
    final Map<String, String> categoryEndpoints = {
      "إعلانات القبول والتسجيل": "/api/announcements/registration",
      "الإعلانات المالية": "/api/announcements/finance",
    };

    String endpoint = categoryEndpoints[category] ?? '';

    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data'] as List)
            .map((announcementJson) => Announcement.fromJson(announcementJson))
            .toList();
      } else {
        throw Exception('Failed to load announcements');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
