import 'package:basketlive/models/Lineup.dart';
import 'package:basketlive/service/ApiService.dart';
import 'package:flutter/material.dart';

class MatchLineupScreen extends StatefulWidget {
  final String matchId;

  MatchLineupScreen({required this.matchId});

  @override
  _MatchLineupScreenState createState() => _MatchLineupScreenState();
}

class _MatchLineupScreenState extends State<MatchLineupScreen> {
  late MatchLineup matchLineups;

  
  @override
  void initState() {
    super.initState();
    matchLineups = MatchLineup(matchId: '', statistics: []); // Initialize with default values
    _fetchMatchLineups();
  }

  Future<void> _fetchMatchLineups() async {
    try {
      MatchLineup fetchedLineups = await ApiService.getMatchLineups(widget.matchId);
      setState(() {
        matchLineups = fetchedLineups;
      });
    } catch (e) {
      print('Error fetching match lineups: $e');
      // Handle error accordingly
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Lineups'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Match ID: ${matchLineups.matchId}'),
              SizedBox(height: 16.0),
              Text('Player Statistics:'),
              SizedBox(height: 8.0),
              for (PlayerStats player in matchLineups.statistics)
                Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Name: ${player.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Country: ${player.country}'),
                        Text('Jersey Number: ${player.jerseyNum}'),
                        Text('Position: ${player.position}'),
                        Text('Team: ${player.team}'),
                        Text('Stats: ${player.stats}'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
