import 'dart:convert';
import 'package:basketlive/models/lineup.dart';
import 'package:basketlive/models/live_match.dart';
import 'package:basketlive/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<LiveMatch>> getLiveMatches() async {
    final Uri url = Uri.parse('${ApiConstants.baseUrl}/basketball/live');
    final response = await http.get(url, headers: ApiConstants.headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['matches'];
      return jsonList.map((json) => LiveMatch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load live matches');
    }
  }

  static Future<MatchLineup> getMatchLineups(String matchId) async {
    final Uri url = Uri.parse('${ApiConstants.baseUrl}/basketball/match_lineups/$matchId');
    final response = await http.get(url, headers: ApiConstants.headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return MatchLineup.fromJson(jsonMap); // Assuming you have a fromJson constructor in your MatchLineup class
    } else {
      throw Exception('Failed to load match lineups');
    }
  }
}
