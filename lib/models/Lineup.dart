class PlayerStats {
  final String country;
  final String jerseyNum;
  final String matchId;
  final String name;
  final String position;
  final String team;
  final Map<String, dynamic> stats;

  PlayerStats({
    required this.country,
    required this.jerseyNum,
    required this.matchId,
    required this.name,
    required this.position,
    required this.team,
    required this.stats,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
      country: json['Country'] ?? '',
      jerseyNum: json['Jersey Num'] ?? '',
      matchId: json['Match ID'] ?? '',
      name: json['Name'] ?? '',
      position: json['Position'] ?? '',
      team: json['Team'] ?? '',
      stats: json['Stats'] != null ? Map<String, dynamic>.from(json['Stats']) : {},
    );
  }
}

class MatchLineup {
  final String matchId;
  final List<PlayerStats> statistics;

  MatchLineup({
    required this.matchId,
    required this.statistics,
  });

  factory MatchLineup.fromJson(Map<String, dynamic> json) {
    return MatchLineup(
      matchId: json['Match Id'] ?? '',
      statistics: (json['statistics'] as List<dynamic>?)
              ?.map((stat) => PlayerStats.fromJson(stat))
              .toList() ??
          [],
    );
  }
}
