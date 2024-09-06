import 'dart:convert';

import 'package:first_design/models/agent_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  final String apiUrl = 'https://valorant-api.com/v1/agents';
  Future<AgentModel> getAgents() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return AgentModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load agents');
      }
    } catch (e) {
      throw Exception('Failed to load agents: $e');
    }
  }
}
