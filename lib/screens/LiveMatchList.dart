import 'package:basketlive/models/LiveMatch.dart';
import 'package:basketlive/screens/MatchLineupScreen.dart';
import 'package:basketlive/service/ApiService.dart';
import 'package:flutter/material.dart';

class LiveMatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: FutureBuilder(
        future: ApiService.getLiveMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<LiveMatch> liveMatches = snapshot.data as List<LiveMatch>;

            if (liveMatches.isEmpty) {
              return Center(
                child: Text('No live matches found.'),
              );
            }

            return ListView.separated(
              itemCount: liveMatches.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16.0),
              itemBuilder: (context, index) {
                LiveMatch liveMatch = liveMatches[index];

                return GestureDetector(
                   onTap: () {
        _showMatchDetails(context, liveMatch.matchId);
      },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Away Team: ${liveMatch.awayTeam}'),
                        Text('Away Score: ${liveMatch.awayScore}'),
                        Text('Home Team: ${liveMatch.homeTeam}'),
                        Text('Home Score: ${liveMatch.homeScore}'),
                        Text('League: ${liveMatch.league}'),
                        Text('League ID: ${liveMatch.leagueId}'),
                        Text('Match ID: ${liveMatch.matchId}'),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Initial Odds: ${liveMatch.initialAwayOdd} | ${liveMatch.initialHomeOdd}'),
                            Text('Live Odds: ${liveMatch.liveAwayOdd} | ${liveMatch.liveHomeOdd}'),
                            Text('Status: ${liveMatch.status}'),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text('Period 1: ${liveMatch.period1Away} - ${liveMatch.period1Home}'),
                        Text('Period 2: ${liveMatch.period2Away} - ${liveMatch.period2Home}'),
                        Text('Period 3: ${liveMatch.period3Away} - ${liveMatch.period3Home}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void _showMatchDetails(BuildContext context, String matchId) {
  
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchLineupScreen(matchId: matchId)),
    );
  }