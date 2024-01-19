import 'dart:convert';
import 'package:basketlive/models/Lineup.dart';
import 'package:basketlive/models/LiveMatch.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://sports-live-scores.p.rapidapi.com';

  static Future<List<LiveMatch>> getLiveMatches() async {
    final Uri url = Uri.parse('$baseUrl/basketball/live');
    final Map<String, String> headers = {
      'X-RapidAPI-Key': '8ec235d2f6mshbffe97c67b86260p1a6cb8jsna608fd681823',
      'X-RapidAPI-Host': 'sports-live-scores.p.rapidapi.com',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['matches'];
      return jsonList.map((json) => LiveMatch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load live matches');
    }
  }
  //
  static Future<MatchLineup> getMatchLineups(String matchId) async {
    final Uri url = Uri.parse('$baseUrl/basketball/match_lineups/$matchId');
    final Map<String, String> headers = {
      'X-RapidAPI-Key': '8ec235d2f6mshbffe97c67b86260p1a6cb8jsna608fd681823',
      'X-RapidAPI-Host': 'sports-live-scores.p.rapidapi.com',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return MatchLineup.fromJson(jsonMap); // Assuming you have a fromJson constructor in your MatchLineup class
    } else {
      throw Exception('Failed to load match lineups');
    }
  }


}
