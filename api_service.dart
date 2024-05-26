import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.mangadex.org';

  Future<List<dynamic>> fetchPopularManhwa() async {
    final response = await http.get(Uri.parse('$baseUrl/manga?limit=10'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load manhwa');
    }
  }

  Future<List<dynamic>> searchManhwa(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/manga?title=$query'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to search manhwa');
    }
  }
}
