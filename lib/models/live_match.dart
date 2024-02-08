class LiveMatch {
  final int awayScore;
  final String awayTeam;
  final int homeScore;
  final String homeTeam;
  final double initialAwayOdd;
  final double initialHomeOdd;
  final String league;
  final int leagueId;
  final double liveAwayOdd;
  final double liveHomeOdd;
  final String matchId;
  final int period1Away;
  final int period1Home;
  final int period2Away;
  final int period2Home;
  final int period3Away;
  final int period3Home;
  final String status;

  LiveMatch({
    required this.awayScore,
    required this.awayTeam,
    required this.homeScore,
    required this.homeTeam,
    required this.initialAwayOdd,
    required this.initialHomeOdd,
    required this.league,
    required this.leagueId,
    required this.liveAwayOdd,
    required this.liveHomeOdd,
    required this.matchId,
    required this.period1Away,
    required this.period1Home,
    required this.period2Away,
    required this.period2Home,
    required this.period3Away,
    required this.period3Home,
    required this.status,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    try {
      return LiveMatch(
        awayScore: int.parse(json['Away Score'].toString()) ?? 0,
        awayTeam: json['Away Team'] ?? '',
        homeScore: int.parse(json['Home Score'].toString()) ?? 0,
        homeTeam: json['Home Team'] ?? '',
        initialAwayOdd: double.parse(json['Initial Away Odd'].toString()) ?? 0.0,
        initialHomeOdd: double.parse(json['Initial Home Odd'].toString()) ?? 0.0,
        league: json['League'] ?? '',
        leagueId: int.parse(json['League ID'].toString()) ?? 0,
        liveAwayOdd: double.parse(json['Live Away Odd'].toString()) ?? 0.0,
        liveHomeOdd: double.parse(json['Live Home Odd'].toString()) ?? 0.0,
        matchId: json['Match ID'] ?? '',
        period1Away: int.tryParse(json['Period 1 Away'].toString()) ?? 0,
        period1Home: int.tryParse(json['Period 1 Home'].toString()) ?? 0,
        period2Away: int.tryParse(json['Period 2 Away'].toString()) ?? 0,
        period2Home: int.tryParse(json['Period 2 Home'].toString()) ?? 0,
        period3Away: int.tryParse(json['Period 3 Away'].toString()) ?? 0,
        period3Home: int.tryParse(json['Period 3 Home'].toString()) ?? 0,
        status: json['Status'] ?? '',
      );
    } catch (e) {
      print('Error parsing JSON: $e');
      return LiveMatch(
        awayScore: 0,
        awayTeam: '',
        homeScore: 0,
        homeTeam: '',
        initialAwayOdd: 0.0,
        initialHomeOdd: 0.0,
        league: '',
        leagueId: 0,
        liveAwayOdd: 0.0,
        liveHomeOdd: 0.0,
        matchId: '',
        period1Away: 0,
        period1Home: 0,
        period2Away: 0,
        period2Home: 0,
        period3Away: 0,
        period3Home: 0,
        status: '',
      );
    }
  }
}
