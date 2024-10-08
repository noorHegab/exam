import 'dart:convert';

import 'package:first_design/models/weapons_model.dart';
import 'package:http/http.dart' as http;

class ApiWeapons {
  final String apiUri = 'https://valorant-api.com/v1/weapons';

  Future<Weapons> getWeapons() async {
    try {
      final response = await http.get(Uri.parse(apiUri));

      if (response.statusCode == 200) {
        return Weapons.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load agents');
      }
    } catch (e) {
      throw Exception('Failed to load agents: $e');
    }
  }
}
