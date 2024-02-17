import 'dart:convert';
import 'package:http/http.dart' as http;

class LiveMatch {
  final int? awayScore;
  final String awayTeam;
  final int? homeScore;
  final String homeTeam;
  final double? initialAwayOdd;
  final double? initialHomeOdd;
  final String league;
  final int? leagueId;
  final double? liveAwayOdd;
  final double? liveHomeOdd;
  final String matchId;
  final int? period1Away;
  final int? period1Home;
  final int? period2Away;
  final int? period2Home;
  final int? period3Away;
  final int? period3Home;
  final String status;

  LiveMatch({
    this.awayScore,
    required this.awayTeam,
    this.homeScore,
    required this.homeTeam,
    this.initialAwayOdd,
    this.initialHomeOdd,
    required this.league,
    this.leagueId,
    this.liveAwayOdd,
    this.liveHomeOdd,
    required this.matchId,
    this.period1Away,
    this.period1Home,
    this.period2Away,
    this.period2Home,
    this.period3Away,
    this.period3Home,
    required this.status,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    final int? awayScore = json['Away Score'] != null ? int.tryParse(json['Away Score'].toString()) : null;
    final String awayTeam = json['Away Team'] ?? '';
    final int? homeScore = json['Home Score'] != null ? int.tryParse(json['Home Score'].toString()) : null;
    final String homeTeam = json['Home Team'] ?? '';
    final double? initialAwayOdd = json['Initial Away Odd'] != null ? double.tryParse(json['Initial Away Odd'].toString()) : null;
    final double? initialHomeOdd = json['Initial Home Odd'] != null ? double.tryParse(json['Initial Home Odd'].toString()) : null;
    final String league = json['League'] ?? '';
    final int? leagueId = json['League ID'] != null ? int.tryParse(json['League ID'].toString()) : null;
    final double? liveAwayOdd = json['Live Away Odd'] != null ? double.tryParse(json['Live Away Odd'].toString()) : null;
    final double? liveHomeOdd = json['Live Home Odd'] != null ? double.tryParse(json['Live Home Odd'].toString()) : null;
    final String matchId = json['Match ID'] ?? '';
    final int? period1Away = json['Period 1 Away'] != null ? int.tryParse(json['Period 1 Away'].toString()) : null;
    final int? period1Home = json['Period 1 Home'] != null ? int.tryParse(json['Period 1 Home'].toString()) : null;
    final int? period2Away = json['Period 2 Away'] != null ? int.tryParse(json['Period 2 Away'].toString()) : null;
    final int? period2Home = json['Period 2 Home'] != null ? int.tryParse(json['Period 2 Home'].toString()) : null;
    final int? period3Away = json['Period 3 Away'] != null ? int.tryParse(json['Period 3 Away'].toString()) : null;
    final int? period3Home = json['Period 3 Home'] != null ? int.tryParse(json['Period 3 Home'].toString()) : null;
    final String status = json['Status'] ?? '';

    return LiveMatch(
      awayScore: awayScore,
      awayTeam: awayTeam,
      homeScore: homeScore,
      homeTeam: homeTeam,
      initialAwayOdd: initialAwayOdd,
      initialHomeOdd: initialHomeOdd,
      league: league,
      leagueId: leagueId,
      liveAwayOdd: liveAwayOdd,
      liveHomeOdd: liveHomeOdd,
      matchId: matchId,
      period1Away: period1Away,
      period1Home: period1Home,
      period2Away: period2Away,
      period2Home: period2Home,
      period3Away: period3Away,
      period3Home: period3Home,
      status: status,
    );
  }
}
