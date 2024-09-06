import 'dart:convert';

import 'package:first_design/models/agent_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // Replace with your API URL
  final String apiUrl = 'https://valorant-api.com/v1/agents';
  Future<AgentModel> getAgents() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Assuming the response body is JSON and matches the AgentModel structure
        return AgentModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load agents');
      }
    } catch (e) {
      throw Exception('Failed to load agents: $e');
    }
  }

  // Replace with your API URL
}

// دالة لجلب المصادر بناءً على الفئة
// static Future<List<String>> getSourcesByCategory(
//   String category,
// ) async {
//   Uri url = Uri.https("newsapi.org", "v2/sources", {
//     "country": "us",
//     "category": category,
//     "language": "en", // تحديد اللغة
//     "apiKey": apiKey,
//   });
//
//   http.Response response = await http.get(url);
//   var json = jsonDecode(response.body);
//   List sources = json['sources'] ?? [];
//   return sources.map<String>((source) => source['id'] as String).toList();
// }

// دالة لجلب الأخبار بناءً على المصدر ودعم البحث
// static Future<NewsModel> getNewsBySource(String sourceId,
//     {String? query}) async {
//   final Map<String, String> queryParams = {
//     "sources": sourceId,
//     "language": "en", // تحديد اللغة
//     "apiKey": apiKey,
//   };
//
//   if (query != null && query.isNotEmpty) {
//     queryParams["q"] = query;
//   }
//
//   Uri url = Uri.https("newsapi.org", "v2/top-headlines", queryParams);
//   http.Response response = await http.get(url);
//   var json = jsonDecode(response.body);
//   return NewsModel.fromJson(json);
// }
